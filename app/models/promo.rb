class Promo < ActiveRecord::Base
  # attr_accessible :title, :body
  config = YAML.load(File.read('config/s3.yml'))[Rails.env]
  has_attached_file :image, 
    :styles => { 
      :large =>        "710x445#",
      :thumb =>        "200X200#"
    },
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :s3_host_alias => config["s3_host_alias"],
    :url => ":s3_alias_url",
    :path => "/paperclip/:class/:id/:style/:filename"
end
