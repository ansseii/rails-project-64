# frozen_string_literal: true

class PostComment < ApplicationRecord
  validates :content, presence: true, length: { minimum: 5, maximum: 200 }

  has_ancestry
  belongs_to :post
  belongs_to :user
end
