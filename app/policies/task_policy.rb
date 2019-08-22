# frozen_string_literal: true

class TaskPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    index?
  end

  def create?
    user.is_a? Admin
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

  private

  def task
    record
  end
end
