class GoalsController < ApplicationController
    
    def index
        @user = User.find(params[:user_id])
        @specific_goal = Goal.find_by_user_id_and_id(params[:user_id],params[:id])
    end
    
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
    
    # GET to /users/:user_id/goals/:id
    def show
        @user = User.find(params[:user_id])
        @specific_goal = Goal.find_by_id(params[:id])
        @comment = Comment.find_by_id(params[:id])
        @goal = Goal.find(params[:id])
    end
    
    # GET to /users/user_id/goals/edit
    def edit
         @user = User.find(params[:user_id])
         @goal = current_user.goals.find(params[:id])
         # @specific_goal = current_user.goals.find(params[:user_id],params[:goals_id])
         @specific_goal = Goal.find_by_user_id_and_id(params[:user_id],params[:id])
         
    end
    
    # PATCH to /users/:user_id/goals/:id
    def update
        @user = User.find(params[:user_id])
        @specific_goal = Goal.find_by_user_id_and_id(params[:user_id],params[:id])
        # Mass assign edited goal attributes (and save + update)
        if @specific_goal.update_attributes(goal_params)
            flash[:success] = "Goal Updated"
            redirect_to user_goal_path(user_id: current_user.id, id: current_user.id)
        else
            flash[:error] = "Error Occurred"
            render action: :edit
        end
    end
    
    def destroy
        @user = User.find(params[:user_id])
        @specific_goal = Goal.find_by_user_id_and_id(params[:user_id],params[:id])
        if @specific_goal.destroy
            flash[:success] = "Goal successfully deleted"
            redirect_to user_goals_path(user_id: current_user.id)
        else
            flash[:danger] = "Unable to delete goal"
            redirect_to user_goals_path(user_id: current_user.id)
        end
    end

    
    # Whitelisting form fields for protection
    private
        def goal_params
            params.require(:goal).permit(:goal_type, :goal_name, :start, :current, :end_goal, :start_date, :current_date, :end_date) 
        end
    
end