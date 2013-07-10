class Attachment < ActiveRecord::Base
	config = YAML.load(File.read('config/s3.yml'))[Rails.env]
  has_attached_file :file,
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :s3_host_alias => config["s3_host_alias"],
    :url => ":s3_alias_url",
    :path => "/paperclip/:class/:id/:style/:filename"
end
