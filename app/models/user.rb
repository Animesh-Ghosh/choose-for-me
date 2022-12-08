# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :movies, class_name: 'Topic::Movie', dependent: :destroy
  has_and_belongs_to_many :foods, class_name: 'Topic::Food', dependent: :destroy
  has_and_belongs_to_many :books, class_name: 'Topic::Book', dependent: :destroy
end
