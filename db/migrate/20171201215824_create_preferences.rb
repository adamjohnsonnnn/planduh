class CreatePreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :preferences do |t|
      t.references :user
      t.string :keyword, null: false
      t.boolean :is_necessary?, default: false

      t.timestamps
    end
  end
end
