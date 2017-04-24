class Comment < ActiveRecord::Base
    
    belongs_to :goal, optional: true
    belongs_to :user
    validates :user, presence: true
    
    
end