class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]
  before_action :set_employee, only: [:index, :create]
  
  def index
    tasks = @employee.tasks.all
    render json: tasks.to_json
  end

  def show
    render json: @task.to_json
  end

  def create
    task = @employee.tasks.create(task_params)

    if task
      render json: task.to_json, status: :created
    else
      render json: task.errors.messages, status: :unprocessable_entity
    end
  end

  def update

    if @task.update(task_params)
      render json: @task.to_json
    else
      render json: @task.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy

    if @task.destroy 
      head :no_content
    else
      head :unprocessable_entity
    end 
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :start_date, :due_date, :status)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end
end
