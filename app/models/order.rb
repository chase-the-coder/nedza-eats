class Order < ApplicationRecord
  belongs_to :user
  validates :address, presence: true
  has_many :item_orders
end
