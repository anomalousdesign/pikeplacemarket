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

    config.actions do
      # root actions
      dashboard                     # mandatory
      # collection actions
      index                         # mandatory
      new
      export
      history_index
      bulk_delete
      # member actions
      show
      edit
      delete
      history_show
      show_in_app

      # Add the nestable action for configured models
      nestable

      toggle
    end

    config.model Page do
      nestable_tree({
        position_field: :position
      })
      edit do
        exclude_fields :ancestry, :slug, :position
      end
      list do
        fields :title, :template
        field :publish, :toggle
      end
    end

    config.model Event do
      fields_of_type :text do
        # bootstrap_wysihtml5 = true
        ckeditor true
        ckeditor_base_location '/ckeditor/'
      end 
      edit do
        exclude_fields :slug
      end
    end

    config.model Merchant do
      fields_of_type :text do
        # bootstrap_wysihtml5 = true
        ckeditor true
        ckeditor_base_location '/ckeditor/'
      end
      fields_of_type :tag_list do
        partial 'tag_list_with_suggestions'
      end
      edit do
        exclude_fields :tags, :map_x, :map_y
      end
    end
    
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