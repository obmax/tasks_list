# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show; end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit; end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.created_by = current_admin.id

    respond_to do |format|
      if @task.save
        html_response(format, to_task, 'Task was successfully created.')
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        html_response(format, @task, 'Task was successfully updated.')
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      html_response(format, tasks_url, 'Task was successfully destroyed.')
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :subject, :description,
      :type, :status, :assignee
    )
  end

  def to_task
    @task.becomes(Task)
  end

  def html_response(format, url, message)
    format.html { redirect_to url, notice: message }
  end
end
