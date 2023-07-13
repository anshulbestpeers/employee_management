class LeavesController < ApplicationController
  before_action :set_employee, only: [:index, :create, :find_leaves, :approved_leave]
  before_action :set_leave, only: [:show, :update, :destroy]

  def index
    leaves = @employee.leaves.all
    render json: leaves 
  end  

  def show
    render json:@leave
  end

  def create 
    leave = @employee.leaves.new(leave_params)
    if leave.save
      render json: leave.to_json, status: :created
    else
      render json: leave.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    if @leave.update(leave_params)
      render json:@leave 
    else
      render json: @leave.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @leave.destroy
      head :no_content
    else 
      head :unprocessable_entity
    end
  end
  
  def applied_leaves
    leaves = Leave.where(mail_to: @employee.email)
    render json: leaves.to_json
  end

  def approved_leave
    leave = Leave.find_by(mail_to: @employee.email, id: params[:id])
    if leave
      if leave.update(status: params[:status])
        render json: { leave: leave }
      else
        render json: @leave.errors.messages, status: :unprocessable_entity
      end
    else
      render :json => {:message => "Leave not exist!"}
    end
  end      

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_leave
    @leave = Leave.find(params[:id])
  end

  def leave_params
    params.require(:leave).permit(:leave_type, :from_date, :from_session, :to_date, :to_session, :mail_to, :reason)
  end
end
