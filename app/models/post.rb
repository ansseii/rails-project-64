# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
  validates :body, presence: true, length: { minimum: 200, maximum: 4000 }

  belongs_to :category
  belongs_to :creator, class_name: 'User'
  has_many :comments, dependent: :delete_all, class_name: 'PostComment'
  has_many :likes, dependent: :delete_all, class_name: 'PostLike'
end
