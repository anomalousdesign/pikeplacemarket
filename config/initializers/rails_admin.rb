# RailsAdmin config file. Generated on May 10, 2012 16:59
# See github.com/sferik/rails_admin for more informations

  
RailsAdmin.config do |config|

    # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
    # require 'i18n'
    # I18n.default_locale = :de

    # config.authenticate_with { authenticate_admin! }
    # config.current_user_method { current_admin } # auto-generated
  
    # config.excluded_models = []

    # If you want to track changes on your models:
    # config.audit_with :history, Admin

    # Or with a PaperTrail: (you need to install it first)
    # config.audit_with :paper_trail, Admin

    # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
    config.main_app_name = ['Pike Place Market', 'Admin']
    
    # All models rails_admin 4
    # config.models.each do |m|
    #   config.model m do
    #     fields_of_type :text do
    #       # bootstrap_wysihtml5 = true
    #       ckeditor true
    #       ckeditor_base_location '/ckeditor/'
    #     end 
    #     fields_of_type :tag_list do
    #       partial 'tag_list_with_suggestions'
    #     end
    #   end
    # end
    
    # rails_admin 3
    # config.models do
    #   fields_of_type :text do
    #     ckeditor true
    #     ckeditor_base_location '/ckeditor/'
    #   end 
    #   fields_of_type :tag_list do
    #     partial 'tag_list_with_suggestions'
    #   end
    # end
end  