class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    render json: {employees: @employees}
  end
end