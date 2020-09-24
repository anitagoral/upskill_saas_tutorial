class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_prams)
    if @contact.save
      redirect_to new_contact_path, notice: "Message sent."
    else 
      redirect_to new_contact_path, notice: "Error occured"
    end
  end
  
  private
  def contact_prams
    params.require(:contact).permit(:name, :email, :comments)
  end
end