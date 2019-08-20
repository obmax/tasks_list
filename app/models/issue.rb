# frozen_string_literal: true

class Issue < Task
  validates :subject, :description, :status, presence: true
end
