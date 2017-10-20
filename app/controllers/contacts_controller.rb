class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		@contact.request = request
		if @contact.deliver
			flash.now[:notice] = "Your message has been successfully sent"
		else
			flash.now[:error] = "Cannot send message."
			render 'new'
		end
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :email, :subject, :message)
	end
end
