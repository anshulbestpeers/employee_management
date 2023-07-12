class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :department
  belongs_to :designation
  has_one :personal_info
  has_and_belongs_to_many :tasks
  has_many :attendances
end
