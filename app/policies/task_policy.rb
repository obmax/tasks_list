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

  def start_working?
    index?
  end

  def back_to_do?
    index?
  end

  def send_to_review?
    index?
  end

  def close?
    user.is_a? Admin
  end

  private

  def task
    record
  end
end
