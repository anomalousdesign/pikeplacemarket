module PagesHelper

	def breadcrumb(page)
    html = ""
    while page = page.parent
      html = "#{link_to page_path(page)} <span>&raquo;</span> #{html}"
    end
    html.html_safe
  end
  
  def page_nav(args = {}, &block)
  	args[:pages] ||= Page.live.where("ancestry is ?", nil)
    args[:pages] = args[:pages].order("position")
    html = ""
  	html << "<ul class='#{ args[:class] || "" }' role='menu'>"
  	if args[:include_home]
  		args [:home_label] ||= "Home"
	  	html << "<li class='home'><a href='/'>#{args[:home_label]}</a></li>"
	  end
    args[:pages].each do |page|
      is_dropdown = !page.children.live.empty? && args[:menu].nil?
      html << "<li class='#{page.label.gsub(" ","_").downcase} #{is_dropdown ? "dropdown-submenu" : ""}'>"
      if page.link.present?
        html << link_to(page.label, page.link)
      else
        html << link_to(page.label, "/#{page.slug}")
        # html << link_to(page.label, page_path(page))
      end
      html << page_nav(pages: page.children.live, class: (is_dropdown ? "dropdown-menu" : "")) if !page.children.live.empty?
      html << "</li>"
    end
    html << capture_haml{yield(block)} if block.present?
    html << "</ul>"
    html.html_safe
  end
end
