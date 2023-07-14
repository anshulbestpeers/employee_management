class SalariesController < ApplicationController
  before_action :set_employee

  def index 
    salaries = @employee.salaries
    render json: salaries
  end

  def create
    salary = @employee.salaries.new(salary_params)
    if salary.save
      render json: salary, status: :created
    else
      render json: salary.errors.messages, status: :unprocessable_entity
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def salary_params
    params.require(:salary).permit(:yearly_package, :monthly_income, :net_income)
  end
end
