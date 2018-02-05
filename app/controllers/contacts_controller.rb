class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:error] = nil
      flash[:notice] = 'Thank you for your message!'
    else
      flash[:error] = 'Cannot send message.'
    end
    redirect_to '/pages/careers'
  end

end
