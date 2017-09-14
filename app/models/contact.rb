class Contact < MailForm::Base
	attribute :name, validate: true
	attribute :email
	validates_format_of :email, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :subject, validate: true
	attribute :message,  validate: true
	attribute :nickname, captcha: true

	def headers
		{
			subject: "Contact Form",
			to: "ashraf.caspian@gmail.com",
			from: %("#{name}" <#{email}>)
		}
	end
end