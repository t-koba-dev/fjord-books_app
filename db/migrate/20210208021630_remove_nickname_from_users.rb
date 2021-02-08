# frozen_string_literal: true

class RemoveNicknameFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :nickname, :string
  end
end
