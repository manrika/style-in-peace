class RemoveDateFromNewsArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :news_articles, :date, :date
  end
end
