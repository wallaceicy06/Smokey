class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :netid

      t.timestamps null: false
    end
    add_index :students, :netid
  end
end
