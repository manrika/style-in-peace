class CreateSavedBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_brands do |t|
      t.references :user
      t.references :brand

      t.timestamps
    end
  end
end
