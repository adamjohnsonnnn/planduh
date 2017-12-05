class CreateItineraries < ActiveRecord::Migration[5.1]
  def change
    create_table :itineraries do |t|
      t.string :name
      t.date :date
      t.text :begin_time
      t.text :end_time
      t.integer :budget
      t.string	:location
      t.boolean :confirmed?
      t.references :user

      t.timestamps
    end
  end
end
