# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test 'user has topics' do
    assert @user.topics.exists?
    assert_equal 3, @user.topics.size
  end

  test 'user has movies' do
    assert @user.movies.exists?
    assert_equal 1, @user.movies.size
    assert_equal topics(:movie_1), @user.movies.first
  end

  test 'user has foods' do
    assert @user.foods.exists?
    assert_equal 1, @user.foods.size
    assert_equal topics(:food_2), @user.foods.first
  end

  test 'user has books' do
    assert @user.books.exists?
    assert_equal 1, @user.books.size
    assert_equal topics(:book_3), @user.books.first
  end
end
