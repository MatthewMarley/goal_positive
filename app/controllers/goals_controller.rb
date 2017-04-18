class GoalsController < ApplicationController
    
    def new
       @goal = Goal.new 
    end
    
    
    def show
        
        @goals = Goal.all 
    end

    
end