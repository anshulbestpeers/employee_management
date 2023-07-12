class AttendancesController < ApplicationController
  before_action :set_employee, only: [:index, :create]
  before_action :set_attendance, only: [:show, :update, :destroy]

  def index
    attendance = @employee.attendances.all
    render json: attendance, each_serializer: AttendanceSerializer
  end  

  def show
    render json:@attendance
  end

  def create 
    attendance = @employee.attendances.new(attendance_params)
    if attendance.save
      render json: attendance.to_json, status: :created
    else
      render json: attendance.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    if @attendance.update(attendance_params)
      render json:@attendance 
    else
      render json: @attendance.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @attendance.destroy
      head :no_content
    else 
      head :unprocessable_entity
    end
  end
  
  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:date, :employee_id)
  end
end
