class CommentsController < ApplicationController
    
    def new
        @specific_goal = Goal.find_by_id(params[:goal_id])
        @comment = Comment.new
    end
    
    def create
        @specific_goal = Goal.find_by_id(params[:goal_id])
        @build_comment = @specific_goal.comments.build(comment_params)
        @build_comment.user_id = current_user.id

        if @build_comment.save
            flash[:success] = "Comment Added"
            redirect_to user_goal_path(user_id: current_user.id, id: @specific_goal.id)
        else
            flash[:error] = @build_comment.errors.full_messages.join(", ")
            redirect_to root_path
            @build_comment
        end
        
    end
    
    
    def destroy
        @specific_goal = Goal.find_by_user_id_and_id(params[:user_id],params[:goal_id])
        @user = User.find(params[:user_id])
        @specific_comment = Comment.find_by_goal_id_and_user_id(params[:goal_id],params[:user_id])
        if @specific_comment.destroy
            flash[:success] = "Comment successfully deleted"
            redirect_to user_goal_path(user_id: current_user.id, id: @specific_goal.id)
        else
            flash[:danger] = "Unable to delete Comment"
            redirect_to user_goals_path(user_id: current_user.id)
        end
    end
    
    
    
    
    private
        def comment_params
            params.require(:comment).permit(:comment, :user_id, :goal_id) 
        end
        
end