class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.all #what happens when this get's bigly?
    end
    
    def show
        @user = User.find( params[:id] )
    end
end