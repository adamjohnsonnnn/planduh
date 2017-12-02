class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :details
      t.references :itinerary

      t.timestamps
    end
  end
end
