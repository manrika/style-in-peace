class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :website_url
      t.string :insta_url
      t.integer :price_category
      t.integer :rating_earth
      t.integer :rating_people
      t.integer :rating_animals
      t.integer :rating_materials
      t.text :about
      t.text :why_we_love_them
      t.string :address
      t.string :splash_image
      t.string :style
      t.boolean :approved, :default => false

      t.timestamps
    end
  end
end
