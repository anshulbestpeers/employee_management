class PersonalInfosController < ApplicationController
  before_action :set_employee

  def create
    personal_info = @employee.build_personal_info(p_info_params)
    if personal_info.save
      render json: personal_info.to_json, status: :created
    else
      render json: personal_info.errors.messages, status: :unprocessable_entity
    end
  end

  def show
    render json: @employee.personal_info.to_json
  end


  def update
    personal_info = @employee.personal_info
    if personal_info.update(p_info_params)
      render json: personal_info.to_json
    else
      render json: personal_info.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @employee.personal_info.destroy
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  private

  def p_info_params
    params.require(:personal_info).permit(:father_name, :mother_name, :dob, :personal_contact, :emergency_contact, :blood_group, :present_address, :permanent_address, :employee_id)
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end
end
