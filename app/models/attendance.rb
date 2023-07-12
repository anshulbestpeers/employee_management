class Attendance < ApplicationRecord
  before_validation :set_in_time, on: :create
  before_validation :set_out_time, on: :update
  belongs_to :employee
  validates :in_time, :date, presence: true

  private

  def set_in_time
    self.in_time = Time.now.strftime("%H:%M:%S")
  end

  def set_out_time
    self.out_time = Time.now.strftime("%H:%M:%S")
  end
end
