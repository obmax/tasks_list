# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Task, type: :model do
  context 'validation tests' do
    it 'ensures the data is present' do
      task = Task.create
      expect(task.valid?).to eq(false)
    end

    it 'ensures the subject is present' do
      task = Task.create(
        description: 'Abasdflgjksg',
        status: 'To Do',
        type: 'Issue'
      )
      expect(task.valid?).to eq(false)
    end

    it 'ensures the description is present' do
      task = Task.create(
        subject: 'Abasdflgjksg',
        status: 'To Do',
        type: 'Issue'
      )
      expect(task.valid?).to eq(false)
    end

    it 'ensures the status is present' do
      task = Task.create(
        subject: 'sssss',
        description: 'Abasdflgjksg',
        type: 'Issue'
      )
      expect(task.valid?).to eq(false)
    end

    it 'ensures the type is present' do
      task = Task.create(
        subject: 'sssss',
        description: 'Abasdflgjksg',
        status: 'To Do'
      )
      expect(task.valid?).to eq(false)
    end
  end
end
