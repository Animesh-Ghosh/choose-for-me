# frozen_string_literal: true

class Movie < ApplicationRecord
  has_and_belongs_to_many :users

  def history
    @history << @movie
  end
  
end
