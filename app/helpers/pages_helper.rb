module PagesHelper

	def breadcrumb(page)
    html = ""
    while page = page.parent
      html = "#{link_to page_path(page)} <span>&raquo;</span> #{html}"
    end
    html.html_safe
  end
  
  def page_nav(args = {})
  	args[:pages] ||= Page.live.where("ancestry is ?", nil)
    args[:pages] = args[:pages].order("position")
    html = ""
  	html << "<ul class='#{ args[:class] || "" }' role='menu'>"
  	if args[:include_home]
  		args [:home_label] ||= "Home"
	  	html << "<li class='home'><a href='/'>#{args[:home_label]}</a></li>"
	  end
    args[:pages].each do |page|
      html << "<li class='#{page.label.gsub(" ","_").downcase} #{!page.children.empty? && args[:menu].nil? ? "dropdown-submenu" : ""}'>"
      html << link_to(page.label, page_path(page))
      html << page_nav(pages: page.children, class: "dropdown-menu") if !page.children.empty?
      html << "</li>"
    end
    html << "</ul>"
    html.html_safe
  end
end
