# frozen_string_literal: true

class Topic < ApplicationRecord
  has_and_belongs_to_many :users

  scope :movies, -> { where(type: 'Topic::Movie') }
  scope :foods, -> { where(type: 'Topic::Food') }
  scope :books, -> { where(type: 'Topic::Book') }

  def self.randomize(current_user)
    rejected_movies = current_user.movies
    movies = Movie.all.excluding(rejected_movies)
    if movies.any?
      @movie = movies.min_by { rand }
      rejected_movies << @movie
      current_user.save
      @movie
    else
      rejected_movies.delete_all
      @movie = Movie.first
    end
  end
end
