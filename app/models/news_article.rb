class NewsArticle < ApplicationRecord

  validates :title, presence: true, format { with: /^(ftp|http|https):\/\/[^ "]+$/ }
  validates :url, presence: true
  validates :blurb, presence: true, length: { in: 100..200 }
  validates :image, presence: true #set rule so it is always a specific img file once seed is gone
  validates :date, presence: true
end
