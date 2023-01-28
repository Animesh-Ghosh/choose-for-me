# frozen_string_literal: true

require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  setup do
    @movie = topics(:movie_1)
    @food  = topics(:food_2)
    @book  = topics(:book_3)
  end

  test 'topics have users' do
    user = users(:one)
    assert_equal user, @movie.users.first
    assert_equal user, @food.users.first
    assert_equal user, @book.users.first
  end

  test 'movies scope only has movies' do
    assert Topic.movies.all? { |movie| movie.is_a? Topic::Movie }
  end

  test 'foods scope only has foods' do
    assert Topic.foods.all? { |food| food.is_a? Topic::Food }
  end

  test 'books scope only has books' do
    assert Topic.books.all? { |book| book.is_a? Topic::Book }
  end
end
