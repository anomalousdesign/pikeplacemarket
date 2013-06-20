class EventsController < ApplicationController

	def show
		@event = Event.find(params[:id])
		@page = Page.find("hours-calendar")
	end

	def create
		params[:event][:under_review] = true
		event = Event.create(params[:event])
		flash[:notice] = "Thanks! We will review your event."
		msg = [
			AppMailer.hash_table("New Event", event.attributes),
			"<br /><br /><h3>Review Now?</h3>",
			"http://#{request.host}/admin/event/#{event.id}/edit",
			"<br /><br />"
		].join("")
		img = Editables::EditableImage.find_by_name("Event #{event.id} Header")
		if img.present?
			msg += [			
				"<img width='400' src='#{img.image.url}' />",
				"<br /><br />",
			]
		end
		AppMailer.send_mail("gabecoyne@gmail.com", "Event Needs Review", msg).deliver
		redirect_to :back
	end

end
