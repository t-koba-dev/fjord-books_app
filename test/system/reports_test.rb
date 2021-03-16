# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:report_written_by_alice)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test '日報一覧ページに文字列\'日報\'がある' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test '日報を作成できる' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '初めての日報'
    fill_in '内容', with: 'こんにちは'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '初めての日報'
    assert_text 'こんにちは'
  end

  test '日報を更新できる' do
    visit reports_url
    within 'table' do
      click_on '編集', match: :first
    end

    fill_in 'タイトル', with: '初めての更新'
    fill_in '内容', with: 'こんにちは更新！'
    click_on '更新する'

    assert_text '初めての更新'
    assert_text 'こんにちは更新！'
    assert_text '日報が更新されました。'
  end

  test '日報を削除できる' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
