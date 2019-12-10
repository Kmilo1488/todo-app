# frozen_string_literal: true

class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.integer :status, null: false, default: 0
      t.integer :workdays
      t.datetime :completed_at
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
