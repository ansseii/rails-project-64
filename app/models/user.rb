# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: :creator_id, dependent: :restrict_with_exception, inverse_of: :creator
  has_many :comments, dependent: :delete_all, class_name: 'PostComment'
  has_many :likes, dependent: :delete_all, class_name: 'PostLike'
end
