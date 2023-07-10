class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  def index
    employees = Employee.all
    render json: employees.to_json
  end

  def show
    render json: @employee.to_json
  end

  def create
    employee = Employee.new(employee_params)
    if employee.save
      render json: employee.to_json, status: :created
    else
      render json: employee.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      render json: @employee.to_json
    else
      render json: @employee.errors.messages, status: :unprocessable_entity
    end
  end
  
  def destroy 
    if @employee.destroy
      head :no_content
    else 
      head :unprocessable_entity
    end
  end

  def find_department
    department = Department.find_by(name:params[:filter])

    if department.present?
      employees = department.employees.includes(:designation)
      render json: employees, each_serializer: EmployeeSerializer, include: [:designation]
    else
      render json: { error: 'Department not found' }, status: :not_found
    end
  end
  
  private
  
  def employee_params
    params.require(:employee).permit(:name, :email, :password, :dob, :qualification, :contact, :gender, :department_id, :designation_id)
  end 

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
