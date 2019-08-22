# frozen_string_literal: true

module TasksHelper
  def is_task_in_to_do?
    @task.status == 'to_do'
  end

  def is_task_in_process?
    @task.status == 'in_progress'
  end

  def is_task_in_review?
    @task.status == 'in_review' && admin_signed_in?
  end
end
