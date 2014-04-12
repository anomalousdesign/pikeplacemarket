class MerchantsController < ApplicationController
	caches_action :index, :show, :unless => Proc.new{|x| x.current_admin.present? }, :expires_in => 1.day
	before_filter :check_host

	def check_host
		if request.host.split('.')[0] == 'www'
			redirect_to "http://" + request.host.gsub('www.','')
		end
	end

	def index
		respond_to do |format|
			format.json{
				# if params[:deep].present?
					render  json: Merchant.deep_hash(MerchantCategory.main)
				# else
				# 	render json: Merchant.nested_hash(MerchantCategory.main)
				# end
			}
			format.html{
				render :index
			}
		end
	end

	def category_json(category)
		category.children.as_json
	end

end
