class PagesController < ApplicationController

  caches_action :show, :unless => Proc.new{|x| x.current_admin.present? || !x.flash.empty? }, :expires_in => 1.hour
  
  def show
    @page = Page.find(params[:id]) rescue nil
    return redirect_to "/" if @page.nil? or (!@page.live && !current_admin)
    render_in_template
  end
  
private

  def render_in_template
    if FileTest.exists?(Rails.root.join('app', 'views', 'pages', "#{@page.template}.html.haml"))
      render "pages/#{@page.template}"
    else
      render "pages/default"
    end
  end
  
end
