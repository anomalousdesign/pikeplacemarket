class EventsController < ApplicationController

	def show
		@event = Event.find(params[:id])
		@page = Page.find("hours-calendar")
	end

end
