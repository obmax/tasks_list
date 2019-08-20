# frozen_string_literal: true

json.extract! task, :id, :subject, :description, :type,
              :status, :created_at, :updated_at
json.url task_url(task, format: :json)
