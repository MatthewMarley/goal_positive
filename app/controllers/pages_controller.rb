class PagesController < ApplicationController
   
    # The corresponding view file will need to be called home.html.erb, and will belong in the "pages" folder.
    def home
        @basic_plan = Plan.find(1)
    end
    
    # The corresponding view file will need to be called about.html.erb, and will belong in the "pages" folder.
    def about
        
    end
    
end