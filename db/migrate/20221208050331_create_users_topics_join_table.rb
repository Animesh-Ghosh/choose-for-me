# frozen_string_literal: true

class CreateUsersTopicsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :topics
  end
end
