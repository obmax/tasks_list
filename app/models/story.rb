class Story < Task
	validates :subject, :description, :status, presence: true
end
