class ContactsController < ApplicationController

    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            name=params[:contact][:name]
            email=params[:contact][:email]
            body=params[:contact][:comments]
            ContactMailer.contact_email(name, email, body).deliver
            
            flash[:success] =  'Message sent.'
            # redirect_to new_contact_path, notice: "Message sent."
        else
            flash[:danger] =  'Message failed.  An error occurred sending your message. Hamsters will be punished!'
            # redirect_to new_contact_path, notice: "An error occurred."
        end
        redirect_to new_contact_path
    end
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end

end
