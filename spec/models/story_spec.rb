require 'rails_helper'
RSpec.describe Task, type: :model do
  context 'validation tests' do
    it 'ensures the data is present' do
      task = Task.new
      expect(task.valid?).to eq(false)
    end

    it 'ensures the subject is present' do
      task = Task.new(description: 'Abasdflgjksg', status: 'To Do', type: 'Issue')
      expect(task.valid?).to eq(false)
    end

    it 'ensures the description is present' do
      task = Task.new(subject: 'Abasdflgjksg', status: 'To Do', type: 'Issue')
      expect(task.valid?).to eq(false)
    end

    it 'ensures the status is present' do
      task = Task.new(subject: 'sssss', description: 'Abasdflgjksg', type: 'Issue')
      expect(task.valid?).to eq(false)
    end
  end
end