# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, except: %i[index new create]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    authorize @tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show; end

  # GET /tasks/new
  def new
    @task = Task.new
    authorize @task
  end

  # GET /tasks/1/edit
  def edit
    @task = to_task
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.created_by = current_admin.id

    respond_to do |format|
      if @task.save
        TaskMailer.with(task: @task).created_task_email.deliver_now
        html_response(format, to_task, 'Task was successfully created.')
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task = to_task
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

  def start_working
    @task.status = 'In Progress'
    @task.save
    TaskMailer.with(task: @task).in_process_status_email.deliver_now

    redirect_to task_url(@task)
  end

  def back_to_do
    @task.status = 'To Do'
    @task.save

    redirect_to task_url(@task)
  end

  def send_to_review
    @task.status = 'In Review'
    @task.save
    TaskMailer.with(task: @task).in_review_status_email.deliver_now

    redirect_to task_url(@task)
  end

  def close
    @task.status = 'Done'
    @task.save
    TaskMailer.with(task: @task).done_status_email.deliver_now

    redirect_to task_url(@task)
  end

  private

  def set_task
    @task = Task.find(params[:id])
    authorize @task
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

  def record_not_found
    flash[:danger] = 'Task not found'
    redirect_to tasks_url
  end
end
