class CreateJacks < ActiveRecord::Migration
  def change
    create_table :jacks do |t|
      t.string :name
      t.references :deck, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
