class SessionsController < ApplicationController
    def new 
        @user = User.new 
    end

    def create 
        # binding.pry 
        @user = User.find_by(name: params[:user][:name])
        authenticated = @user.try(:authenticate, params[:user][:password])
        if authenticated
            session[:user_id] = @user.id 
            redirect_to '/'
        else
            redirect_to(controller: 'users', action: 'new')
        end 

  
    end

    def destroy 
        session.delete :user_id
        redirect_to '/login'
    end
end