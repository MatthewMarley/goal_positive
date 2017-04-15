class Users::RegistrationsController < Devise::RegistrationsController
    def create
        # super = We want to inherit your create action, then extend it
        # imagine resource means user
        super do |resource|
            # if a params plan_id exists in the url (which it will do as 1 for basic).
            if params[:plan]
                resource.plan_id = params[:plan]
                resource.save
                flash[:notice] = "Sign up successful"
            else
                flash[:alert] = "Error occured"
            end
        end
    end
end