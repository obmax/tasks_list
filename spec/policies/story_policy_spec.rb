# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StoryPolicy, type: :policy do
  let(:story) { Story.new }
  subject { described_class }
  let(:error) { Pundit::NotAuthorizedError }

  context 'Visitor' do
    let(:user) { nil }

    it 'does not allow to #index' do
      expect { Pundit.authorize(user, story, :index?) }.to raise_error(error)
    end
    it 'does not allow to #show' do
      expect { Pundit.authorize(user, story, :show?) }.to raise_error(error)
    end
    it 'does not allow to #new' do
      expect { Pundit.authorize(user, story, :new?) }.to raise_error(error)
    end
    it 'does not allow to #edit' do
      expect { Pundit.authorize(user, story, :edit?) }.to raise_error(error)
    end
    it 'does not allow to #create' do
      expect { Pundit.authorize(user, story, :create?) }.to raise_error(error)
    end
    it 'does not allow to #update' do
      expect { Pundit.authorize(user, story, :update?) }.to raise_error(error)
    end
    it 'does not allow to #destroy' do
      expect { Pundit.authorize(user, story, :destroy?) }.to raise_error(error)
    end
  end

  context 'User' do
    let(:user) { User.new }
    let(:admin) { Admin.new }

    permissions :index?, :show? do
      it 'grants access for user' do
        expect(subject).to permit(user, story)
      end

      it 'grants access for admin' do
        expect(subject).to permit(admin, story)
      end
    end

    permissions :new?, :edit?, :create?, :update?, :destroy? do
      it 'denies access for user' do
        expect(subject).not_to permit(user, story)
      end

      it 'grants access for admin' do
        expect(subject).to permit(admin, story)
      end
    end
  end
end
