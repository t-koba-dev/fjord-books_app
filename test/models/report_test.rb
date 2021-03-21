# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @alice = users(:alice)
    @report = reports(:report_written_by_alice)
  end

  test '#editable?' do
    bob = User.create!(email: 'bob1@example.com', password: 'password')

    assert @report.editable?(@alice)
    assert_not @report.editable?(bob)
  end

  test '#created_on' do
    assert @report.created_on == Time.zone.today
    assert_not @report.created_on == Time.zone.today.next_day
  end
end
