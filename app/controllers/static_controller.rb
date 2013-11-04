class StaticController < ApplicationController
	
  caches_action :show, :unless => Proc.new{|x| x.current_admin.present? }, :expires_in => 1.hour

  def signup
  	if params[:company].present?
  		flash[:alert] = "We think you are a robot... Please contact if info@pikeplacemarket.org if you are a human."
  		return redirect_to :back
  	end
  	if params[:email].present? && params[:email].empty?
  		flash[:alert] = "We need at least need your email to sign you up."
  		return redirect_to :back
  	end
  	Subscriber.create name: "#{params[:first_name]} #{params[:last_name]}", email: params[:email]
  	flash[:notice] = "Thanks for subscribing!"
  	redirect_to :back
  end

end
