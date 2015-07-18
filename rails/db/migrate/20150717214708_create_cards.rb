class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :capacity
      t.references :deck, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
