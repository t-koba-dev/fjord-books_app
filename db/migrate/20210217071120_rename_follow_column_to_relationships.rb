# frozen_string_literal: true

class RenameFollowColumnToRelationships < ActiveRecord::Migration[6.1]
  def change
    rename_column :relationships, :follow_id, :following_id
  end
end
