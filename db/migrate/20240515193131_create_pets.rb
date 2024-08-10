# frozen_string_literal: true

class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :kind
      t.string :breed

      t.timestamps
    end
  end
end
