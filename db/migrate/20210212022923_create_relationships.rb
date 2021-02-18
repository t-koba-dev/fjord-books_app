# frozen_string_literal: true

class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.references :follower, foreign_key: { to_table: :users }
      t.references :follow, foreign_key: { to_table: :users }
      t.timestamps

      t.index %i[follower_id follow_id], unique: true
    end
  end
end
