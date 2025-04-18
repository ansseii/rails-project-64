# frozen_string_literal: true

class AddUserToPostComment < ActiveRecord::Migration[7.2]
  def change
    add_reference :post_comments, :user, null: false, foreign_key: true
  end
end
