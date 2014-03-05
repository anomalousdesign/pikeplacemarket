class StaticController < ApplicationController
	
    caches_action :show, :unless => Proc.new{|x| x.current_admin.present? }, :expires_in => 1.hour
    
    def signup
        if params[:category].empty? || params[:category] != DateTime.current.utc.strftime("%Y%m%d")
            flash[:alert] = "Thanks for subscribing!"
            return redirect_to :back
        end
        if params[:website].present?
            flash[:alert] = "Thanks for subscribing!"
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