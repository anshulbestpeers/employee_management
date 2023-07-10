class Designation < ApplicationRecord
  has_many :employees
  has_many :departments, through: :employees
end
