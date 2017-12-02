class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :display_address
      t.string :time_start
      t.string :event_site_url
      t.string :tickets_url
      t.float  :cost, :precision => 4, :scale => 2
      t.float  :cost_max, :precision => 4, :scale => 2
      t.string :image_url

      t.references :itinerary

      t.timestamps
    end
  end
end
