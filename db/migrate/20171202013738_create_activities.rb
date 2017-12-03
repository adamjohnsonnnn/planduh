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
      t.string   :rating
      t.string   :price
      t.string   :display_phone
      t.string   :title
      t.string   :url
      t.decimal  :latitude
      t.decimal  :longitude
      t.string   :version

      t.references :itinerary

      t.timestamps
    end
  end
end
