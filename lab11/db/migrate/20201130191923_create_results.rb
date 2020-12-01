# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.float :value
      t.text :result

      t.timestamps
    end
    add_index :results, :value, unique: true
  end
end
