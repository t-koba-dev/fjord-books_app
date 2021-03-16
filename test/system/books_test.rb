# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:book_about_ruby)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test '本一覧ページに文字列\'本\'がある' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test '本を作成できる' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'Ruby超入門'
    fill_in 'メモ', with: 'すごくわかりやすい！'
    fill_in '著者', with: 'Mr igaiga'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'Ruby超入門'
    assert_text 'すごくわかりやすい！'
    assert_text 'Mr igaiga'
  end

  test '本を更新できる' do
    visit books_url
    within 'table' do
      click_on '編集', match: :first
    end

    fill_in 'タイトル', with: 'Ruby超更新'
    fill_in 'メモ', with: 'すごく更新！'
    fill_in '著者', with: 'Mr 更新'
    click_on '更新する'

    assert_text 'Ruby超更新'
    assert_text 'すごく更新！'
    assert_text 'Mr 更新'
    assert_text '本が更新されました。'
  end

  test '本を削除できる' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
