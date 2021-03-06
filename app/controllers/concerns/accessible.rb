# frozen_string_literal: true

module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected

  def check_user
    if current_admin
      flash.clear
      redirect_to(tasks_path) && return
    elsif current_user
      flash.clear
      # The authenticated root path can be defined in your routes.rb in:
      # devise_scope :user do...
      redirect_to(tasks_path) && return
    end
  end
end
