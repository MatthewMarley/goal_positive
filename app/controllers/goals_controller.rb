class GoalsController < ApplicationController
    
    def new
       @goal = Goal.new 
    end
    
    
    def create
        @user = User.find(params[:user_id])
        @goal = @user.goals.build(goal_params)
        
        if @goal.save
            flash[:success] = "Goal Added"
            redirect_to user_goals_path(user_id: current_user.id)
        else
            flash[:error] = "Error Occured"
            redirect_to new_user_goals_path(user_id: current_user.id)
        end
        
    end
    
    
    def show
        
        @user = User.find(params[:user_id])
        
    end

    
    # Whitelisting form fields for protection
    private
        def goal_params
            params.require(:goal).permit(:goal_type, :goal_name, :start, :current, :end_goal, :start_date, :current_date, :end_date) 
        end
    
end