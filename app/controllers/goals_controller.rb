class GoalsController < ApplicationController
    
    def new
       @goals = Goal.new 
    end
    
    
    def show
        
        @goals = Goal.all 
    end

    
end