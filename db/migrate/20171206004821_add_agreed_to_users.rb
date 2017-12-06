class AddAgreedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :agreed, :boolean
  end
end
