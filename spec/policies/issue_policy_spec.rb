# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IssuePolicy, type: :policy do
  let(:issue) { Issue.new }
  subject { described_class }
  let(:error) { Pundit::NotAuthorizedError }

  context 'Visitor' do
    let(:user) { nil }

    it 'does not allow to #index' do
      expect { Pundit.authorize(user, issue, :index?) }.to raise_error(error)
    end
    it 'does not allow to #show' do
      expect { Pundit.authorize(user, issue, :show?) }.to raise_error(error)
    end
    it 'does not allow to #new' do
      expect { Pundit.authorize(user, issue, :new?) }.to raise_error(error)
    end
    it 'does not allow to #edit' do
      expect { Pundit.authorize(user, issue, :edit?) }.to raise_error(error)
    end
    it 'does not allow to #create' do
      expect { Pundit.authorize(user, issue, :create?) }.to raise_error(error)
    end
    it 'does not allow to #update' do
      expect { Pundit.authorize(user, issue, :update?) }.to raise_error(error)
    end
    it 'does not allow to #destroy' do
      expect { Pundit.authorize(user, issue, :destroy?) }.to raise_error(error)
    end
  end

  context 'User' do
    let(:user) { User.new }
    let(:admin) { Admin.new }

    permissions :index?, :show? do
      it 'grants access for user' do
        expect(subject).to permit(user, issue)
      end

      it 'grants access for admin' do
        expect(subject).to permit(admin, issue)
      end
    end

    permissions :new?, :edit?, :create?, :update?, :destroy? do
      it 'denies access for user' do
        expect(subject).not_to permit(user, issue)
      end

      it 'grants access for admin' do
        expect(subject).to permit(admin, issue)
      end
    end
  end
end
