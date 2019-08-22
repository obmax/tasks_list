# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def pundit_user
    current_user || current_admin
  end

  private

  def user_not_authorized
    flash[:dark] = 'You are not authorized to perform this action.'
    pundit_user.present? ? redirect_to(tasks_path) : redirect_to(root_path)
  end
end
