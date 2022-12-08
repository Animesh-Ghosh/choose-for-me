# frozen_string_literal: true

class ChangeMoviesToTopics < ActiveRecord::Migration[7.0]
  def change
    rename_table :movies, :topics
  end
end
