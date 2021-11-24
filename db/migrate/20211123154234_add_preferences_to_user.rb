class AddPreferencesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :preference_price, :integer
    add_column :users, :preference_style, :string
  end
end
