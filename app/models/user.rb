class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  has_one :profile
  has_many :goals, inverse_of: :user
  # Double check this as may not be correct... Many-to-many association
  # has_many :comments, through: :goals
  has_many :comments
  accepts_nested_attributes_for :comments
  
end
