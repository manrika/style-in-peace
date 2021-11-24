class AddDateToNewsArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :news_articles, :date, :string
  end
end
