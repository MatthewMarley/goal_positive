class ProfilesController < ApplicationController
   
    def new
        @profile = Profile.new
    end 
   
    def create
        # Find the specific user filling out the form
        @user = User.find(params[:user_id])
        
        # Create a profile instance variable, and link it to the User database model through the foreign User key,
        # then input the profile params from the form fields into @profile. We have already defined @profile as
        # Profile.new in the new action so the computer has a blank profile object in it's memory, ready to fill with data.
        @profile = @user.build_profile(profile_params)
        
        if @profile.save
            flash[:success] = "Profile updated"
            redirect_to root_path
        else
            flash[:danger] = "Profile not updated"
            redirect_to root_path
        end
    end
    
    
    
    private
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :contact_email)
        end
    
    
end