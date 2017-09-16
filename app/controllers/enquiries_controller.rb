class EnquiriesController < ApplicationController
  def new
  	@enquiry = Enquiry.new
  end

  def create
  	@enquiry = Enquiry.new(enquiry_params)
  	if @enquiry.save
  		send_mail(
  			to: @enquiry.subject.email
  			subject: @enquiry.subject.title
  			body: @enquiry.message
  			)
  	else
  		render :new
  	end
  end

  private

  def enquiry_params
  	params.require(:enquiry).permit(:email, :name, :message, :subject_id)
  end
end
