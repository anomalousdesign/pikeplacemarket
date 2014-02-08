class EventsController < ApplicationController
	
  caches_action :show, :unless => Proc.new{|x| x.current_admin.present? }, :expires_in => 1.hour

	def show
		@event = Event.find(params[:id])
		@page = Page.find("hours-calendar")
	end

	def create
		if !params[:event][:title].present?
			flash[:alert] = "Your event was not created. You need to include a title with your event."
			return redirect_to :back 
		end
        if params[:event][:image].present?
			if params[:event][:image].size >= 512000
				flash[:alert] = "Your event was not created. Images must be smaller than 500KB."
				return redirect_to :back
			end
		end
		if params[:event][:subtitle].present?
  		flash[:alert] = "We think you are a robot... Please contact if info@pikeplacemarket.org if you are a human."
  		return redirect_to :back
		end
		if params[:event][:price].match(/free/i)
			params[:event][:price] = 0
		else
			params[:event][:price].gsub!(/[^\d\.]/, '')
		end
		params[:event][:under_review] = true
		event = Event.create(params[:event])
		flash[:notice] = "Thank you for submitting your event! It will be posted upon review."
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
			].join("")
		end
		AppMailer.send_mail("info@pikeplacemarket.org", "Event Needs Review", msg).deliver
		redirect_to :back
	end

end
