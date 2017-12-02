class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string   :name
      t.string   :display_address
      t.string   :time_start
      t.string   :event_site_url
      t.string   :tickets_url
      t.integer  :cost
      t.integer  :cost_max
      t.boolean  :is_free
      t.boolean  :is_canceled
      t.string   :image_url

      t.references :itinerary

      t.timestamps
    end
  end
end
