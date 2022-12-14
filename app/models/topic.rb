# frozen_string_literal: true

class Topic < ApplicationRecord
  has_and_belongs_to_many :users

  scope :movies, -> { where(type: 'Topic::Movie') }
  scope :foods, -> { where(type: 'Topic::Food') }
  scope :books, -> { where(type: 'Topic::Book') }

  def self.randomize(current_user, topics)
    rejected_options = current_user.movies
    options = topics.all.excluding(rejected_options)
    if options.any?
      @option = options.min_by { rand }
      rejected_options << @option
      current_user.save
      @option
    else
      rejected_options.delete_all
      @option = topics.first
    end
  end
end
