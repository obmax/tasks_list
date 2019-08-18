class Task < ApplicationRecord
  validates :subject, :status, :type, presence: true

  enum status: {
    to_do: 'To Do',
    in_progress: 'In Progress', 
    in_review: 'In Review', 
    done: 'Done' 
  }

  def self.types
    %w(Issue Story)
  end
end
