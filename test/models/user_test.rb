# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @alice = User.create!(email: 'alice1@example.com', password: 'password')
    @bob = User.create!(email: 'bob1@example.com', password: 'password')
  end

  test "#name_or_email" do
    assert_equal 'alice1@example.com', @alice.name_or_email

    @alice.name = 'alice'
    assert_equal 'alice', @alice.name_or_email
  end

  test "#follow" do
    assert_not @alice.following?(@bob)
    assert_not @bob.followed_by?(@alice)
    @alice.follow(@bob)
    assert @alice.following?(@bob)
    assert @bob.followed_by?(@alice)
  end

  test "#unfollow" do
    @alice.follow(@bob)
    assert @alice.following?(@bob)
    assert @bob.followed_by?(@alice)
    @alice.unfollow(@bob)
    assert_not @alice.following?(@bob)
    assert_not @bob.followed_by?(@alice)
  end
end
