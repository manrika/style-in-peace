class AddAttributesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :brands_shared, :integer
    add_column :users, :brands_referred, :integer
    add_column :users, :friends_referred, :integer
  end
end
