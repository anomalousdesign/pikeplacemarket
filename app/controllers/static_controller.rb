class StaticController < ApplicationController

  def signup
  	Subscriber.create name: "#{params[:first_name]} #{params[:last_name]}", email: params[:email]
  end

end
