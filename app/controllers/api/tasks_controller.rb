class Api::TasksController < ApplicationController

  def create
    @task = Task.new(task_params)

    if @task.save!
      render :show
    else
      render json: @task.error.full_messages, status: 402
  end

  def show
    @task = Task.find(params[:id])
    render :show
  end

  def index
    @task = Task.all
    render :index

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      render :show
    else
      render json: @task.errors.full_messages, status: 402
  end

  private

  def task_params
    params.require(:task).permit(
      :user_id,
      :tasker_id,
      :category_id,
      :description,
      :location,
      :task_date,
      :task_start_time
    )
end