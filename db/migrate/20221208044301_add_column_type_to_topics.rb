# frozen_string_literal: true

class AddColumnTypeToTopics < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :type, :string
  end
end
