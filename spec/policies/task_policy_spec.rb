# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaskPolicy, type: :policy do
  let(:task) { Task.new }
  subject { described_class }
  let(:error) { Pundit::NotAuthorizedError }

  context 'Visitor' do
    let(:user) { nil }

    it 'does not allow to #index' do
      expect { Pundit.authorize(user, task, :index?) }.to raise_error(error)
    end
    it 'does not allow to #show' do
      expect { Pundit.authorize(user, task, :show?) }.to raise_error(error)
    end
    it 'does not allow to #new' do
      expect { Pundit.authorize(user, task, :new?) }.to raise_error(error)
    end
    it 'does not allow to #edit' do
      expect { Pundit.authorize(user, task, :edit?) }.to raise_error(error)
    end
    it 'does not allow to #create' do
      expect { Pundit.authorize(user, task, :create?) }.to raise_error(error)
    end
    it 'does not allow to #update' do
      expect { Pundit.authorize(user, task, :update?) }.to raise_error(error)
    end
    it 'does not allow to #destroy' do
      expect { Pundit.authorize(user, task, :destroy?) }.to raise_error(error)
    end
  end

  context 'User' do
    let(:user) { User.new }
    let(:admin) { Admin.new }

    permissions :index?, :show? do
      it 'grants access for user' do
        expect(subject).to permit(user, task)
      end

      it 'grants access for admin' do
        expect(subject).to permit(admin, task)
      end
    end

    permissions :new?, :edit?, :create?, :update?, :destroy? do
      it 'denies access for user' do
        expect(subject).not_to permit(user, task)
      end

      it 'grants access for admin' do
        expect(subject).to permit(admin, task)
      end
    end
  end
end
