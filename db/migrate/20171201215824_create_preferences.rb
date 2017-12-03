class CreatePreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :preferences do |t|
      t.references :user
      t.text :keywords, null: false
      t.text  :events_categories, null: false
      t.text :business_categories, null: false
      t.boolean :is_necessary?, default: false

      t.timestamps
    end
  end
end


