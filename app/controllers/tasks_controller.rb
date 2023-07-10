class TasksController < ApplicationController

  def index
    tasks = Task.all
    render json: tasks.to_json
  end

    
end
