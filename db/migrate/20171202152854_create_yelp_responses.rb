class CreateYelpResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :yelp_responses do |t|
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

      t.timestamps
    end
  end
end
