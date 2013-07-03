class MerchantsController < ApplicationController
	caches_action :index, :show, :unless => Proc.new{|x| x.current_admin.present? }, :expires_in => 1.day
end
