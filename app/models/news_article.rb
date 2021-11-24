class NewsArticle < ApplicationRecord

  validates :title, presence: true
  validates :url, presence: true, format: { with: /(ftp|http|https):\/\/[^ "]+/ }
  validates :blurb, presence: true, length: { maximum: 200 }
  validates :image, presence: true
  validates :date, presence: true
end
