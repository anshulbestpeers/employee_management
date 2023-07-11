class Attendance < ApplicationRecord
  belongs_to :employee
  validates :in_time, :date, presence: true
  validate :out_time_after_in_time
end
