# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :posts, dependent: :restrict_with_exception
end
