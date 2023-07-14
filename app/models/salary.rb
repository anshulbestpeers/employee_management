class Salary < ApplicationRecord
  belongs_to :employee
  before_create :calculate_monthly_income

  def calculate_monthly_income
    self.monthly_income = self.yearly_package / 12
    self.net_income = self.monthly_income - approved_leaves 
  end

  def approved_leaves
    employee =  Employee.find(self.employee_id)
    last_month_start = Date.today.last_month.beginning_of_month
    last_month_end = Date.today.last_month.end_of_month
    total_days = 0

    leaves = employee.leaves.where(status: 'accepted', from_date: last_month_start..last_month_end, to_date: last_month_start..last_month_end)

    leaves.each do |leave|
      total_days = total_days+leave.days
    end
    self.total_leaves = total_days
    total_days*self.monthly_income / 30
  end
end
