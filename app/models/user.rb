# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :topics, dependent: :destroy
  has_and_belongs_to_many :movies, join_table: 'topics_users', dependent: :destroy, association_foreign_key: 'topic_id', class_name: 'Topic::Movie'
  has_and_belongs_to_many :foods, class_name: 'Topic::Food', dependent: :destroy, join_table: 'topics_users', association_foreign_key: 'topic_id'
  has_and_belongs_to_many :books, class_name: 'Topic::Book', dependent: :destroy, join_table: 'topics_users', association_foreign_key: 'topic_id' 
end
