# frozen_string_literal: true

class Admin < ApplicationRecord
  has_many :task, foreign_key: :created_by
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
