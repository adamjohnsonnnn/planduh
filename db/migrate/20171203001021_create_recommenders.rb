class CreateRecommenders < ActiveRecord::Migration[5.1]
  def change
    create_table :recommenders do |t|

    	t.text :event_matrix
    	t.text :business_matrix

      t.timestamps
    end
  end
end
