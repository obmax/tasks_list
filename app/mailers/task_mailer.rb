# frozen_string_literal: true

class TaskMailer < ApplicationMailer
  default from: 'Maks99_08@mail.ru'

  def created_task_email
    @task = params[:task]
    mail(to: @task.user.email, subject: 'Created task for you.')
  end

  def in_process_status_email
    @task = params[:task]
    mail(to: @task.admin.email, subject: 'Tasks status switched to In Process.')
  end

  def in_review_status_email
    @task = params[:task]
    mail(to: @task.admin.email, subject: 'Tasks status switched to In Review.')
  end

  def done_status_email
    @task = params[:task]
    mail(to: @task.admin.email, subject: 'Tasks status switched to Done.')
  end
end
