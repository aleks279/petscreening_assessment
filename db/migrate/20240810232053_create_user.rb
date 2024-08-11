# frozen_string_literal: true

class CreateUser < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :id_number

      t.timestamps
    end

    add_reference :pets, :user, index: true
  end
end
