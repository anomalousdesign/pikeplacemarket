class MerchantsController < ApplicationController
	caches_action :index, :show, :unless => Proc.new{|x| x.current_admin.present? }, :expires_in => 1.day

	def index
		respond_to do |format|
			format.json{
				@merchants = {}
				MerchantCategory.main.each{|category|
					@merchants[category.name] = {}
					category.children.map{|child|
						@merchants[category.name][child.name] = child.merchants.as_json
					}
				}
				render json: @merchants
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
