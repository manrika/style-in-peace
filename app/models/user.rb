class User < ApplicationRecord
  # check address can be geocoded
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :saved_brands
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :preference_price, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..5 }
  validates :preference_style, presence: true, inclusion: { in: %w[modern outdoor minimalist retro boujie arty
                                                                   scandinavian grunge formal lounge boho] }
  # validates :address, presence: true
end
