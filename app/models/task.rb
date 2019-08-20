# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :admin, foreign_key: :created_by
  belongs_to :user, foreign_key: :assignee
  validates :subject, :description, :status, :type, presence: true

  enum status: {
    to_do: 'To Do',
    in_progress: 'In Progress',
    in_review: 'In Review',
    done: 'Done'
  }

  def self.types
    %w[Issue Story]
  end
end
