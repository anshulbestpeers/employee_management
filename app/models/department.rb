class Department < ApplicationRecord
  has_many :employees
  has_many :designations, through: :employees
end
