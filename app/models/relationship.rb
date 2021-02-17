# frozen_string_literal: true

class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :following, class_name: 'User'

  validates :user_id, presence: true
  validates :following_id, presence: true
end
