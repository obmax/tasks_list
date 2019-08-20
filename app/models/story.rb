# frozen_string_literal: true

class Story < Task
  validates :subject, :description, :status, presence: true
end
