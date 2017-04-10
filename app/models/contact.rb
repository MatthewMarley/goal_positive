class Contact < ActiveRecord::Base
    validates :name, presence: true
    validates :email, presence: true
    validates :comments, presence: true
    
    validates :name, length: { minimum: 2, too_short: "Please enter a name longer than 1 letter" }
    
end