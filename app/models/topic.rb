# frozen_string_literal: true

class Topic < ApplicationRecord
  has_and_belongs_to_many :users

  scope :movies, -> { where(type: 'Topic::Movie') }
  scope :foods, -> { where(type: 'Topic::Food') }
  scope :books, -> { where(type: 'Topic::Book') }

  def self.randomize(current_user)
    rejected_topics = current_user.movies
    movies = Topic.movies.all.excluding(rejected_topics)
    if movies.any?
      @movie = movies.min_by { rand }
      rejected_topics << @movie
      current_user.save
      @movie
    else
      rejected_topics.delete_all
      @movie = Topic.movies.first
    end
  end
end
