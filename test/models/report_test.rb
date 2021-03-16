# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "#editable?" do
    alice = User.create!(email: 'alice1@example.com', password: 'password')
    bob = User.create!(email: 'bob1@example.com', password: 'password')
    report = Report.create!(user: alice, title: 'first_report', content: 'hello_bob')

    assert report.editable?(alice)
    assert_not report.editable?(bob)
  end
end
