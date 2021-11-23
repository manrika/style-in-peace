class CreateNewsArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :news_articles do |t|
      t.string :title
      t.string :url
      t.text :blurb
      t.string :image
      t.date :date

      t.timestamps
    end
  end
end
