# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render layout: false
  end
end
