class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :capacity
      t.boolean :active
      t.belongs_to :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
