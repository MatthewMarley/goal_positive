class UsersController < ApplicationController

    # GET to /users/:id
    def show
        # It is not params[:user_id] as it just needs to match whatever the web URL is.
        @user = User.find(params[:id])
    end

end