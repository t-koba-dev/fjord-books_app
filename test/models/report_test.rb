# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @alice = users(:alice)
    @report = reports(:report_written_by_alice)
  end

  test '#editable?' do
    bob = users(:bob)

    assert @report.editable?(@alice)
    assert_not @report.editable?(bob)
  end

  test '#created_on' do
    assert_equal @report.created_on, Time.zone.today
  end
end
