class AppMailer < ActionMailer::Base

  default :from => "Pike Place Market <info@pikeplacemarket.org>" , :return_path => 'info@pikeplacemarket.org'
  # layout "email"
  
  def send_mail(to, subject, message)
    @message = message
    mail(:to => to, :subject => subject)
  end

  def self.hash_table(title, hash)
  	return "" if hash.empty?
  	str = "<h3>#{title}</h3><table>"
  	hash.each do |key,val|
  		str += "<tr><td><strong>#{key.titleize}</strong></td><td>#{val}</td></tr>"
  	end
  	str += "</table>"
  end

end
