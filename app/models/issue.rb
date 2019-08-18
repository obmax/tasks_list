class Issue < Task
  validates :subject, :description, :status, presence: true
end
