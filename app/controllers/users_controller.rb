class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        render "/users/new"
    end

    def create_process
        @user = User.create( user_params )
        if @user.save
            redirect_to "/users"
        else
            flash[:errors] = []
            flash[:errors] = @user.errors.full_messages
            redirect_to "/users/new"
        end
    end

    def show
        @user = User.find( params[:id] )
    end

    def edit
        @user = User.find( params[:id] )
    end

    def update
        @user = User.find( params[:id] )
        if @user.update( user_params )
            redirect_to "/users"
        else
            flash[:errors] = []
            flash[:errors] = @user.errors.full_messages
            redirect_to "/users/#{@user.id}/edit"
        end
    end

    def destroy
        user = User.find( params[:id] )
        user.destroy!
        redirect_to "/users"
    end

    def back
        redirect_to "/users"
    end

    private
    def user_params
        params.require(:form).permit(:first_name, :last_name, :email_address, :password)
    end

end
