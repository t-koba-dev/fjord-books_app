# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @alice = User.create!(email: 'alice1@example.com', password: 'password')
    @report = Report.create!(user: @alice, title: 'first_report', content: 'hello_bob')
  end

  test "#editable?" do
    bob = User.create!(email: 'bob1@example.com', password: 'password')

    assert @report.editable?(@alice)
    assert_not @report.editable?(bob)
  end

  test "#created_on" do

    assert @report.created_on == Date.today
    assert_not @report.created_on == Date.today.next_day
  end
end
