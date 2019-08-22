# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(name)
    {
      success: 'alert-success',
      secondary: 'alert-secondary',
      error: 'alert-danger',
      dark: 'alert-dark',
      danger: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[name.to_sym] || name
  end
end
