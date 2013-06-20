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
			"<br /><br />Review Now?<br />",
			"http://#{request.host}/admin/event/#{event.id}/edit"
		].join("")
		AppMailer.send_mail("gabecoyne@gmail.com", "Event Needs Review", msg).deliver
		redirect_to :back
	end

end
