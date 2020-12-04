# frozen_string_literal: true

class RemovePasswordFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :password, :string
  end
end
