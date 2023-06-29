class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:session][:username])
        # byebug
        if user && user.authenticate(params[:session][:password])
            # byebug
            session[:user_id] = user.id
            flash[:success] = "You have successfully logged in"
            redirect_to root_path
        else
            # byebug
            flash.now[:error]= "There was somethong wrong with your login information"
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have successfully logged out"
        redirect_to login_path
    end
end
