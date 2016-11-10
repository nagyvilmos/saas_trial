class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :only_current_user
    
    def new
        # form for each user to fill out there own profile
        @profile = Profile.new
    end
    
    def create
        # create a user profile
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:success] = "Profile updated"
            redirect_to user_path( @user.id )
        else
            render action: :new 
        end
    end
    
    def edit
        # edit an existing profile.
        @profile = @user.profile
    end
    
    def update
        # create a user profile
        @profile = @user.profile # then?
        if @profile.update_attributes(profile_params)
            flash[:success] = "Profile updated"
            redirect_to user_path( @user.id )
        else
            render action: :edit 
        end
    end
    private
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
        end
        
        def only_current_user
            @user = User.find( params[:user_id] )
            redirect_to(root_url) unless @user == current_user
        end
end
