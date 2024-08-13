class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      # redirect_to restaurants_path
      redirect_to task_path(@task)
    end
  end

  def edit; end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.delete
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
