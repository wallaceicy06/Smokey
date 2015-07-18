class Card < ActiveRecord::Base
  belongs_to :deck

  validates :name, presence: true
  validates :capacity, numericality: { only_integer: true }
  validates :deck, presence: true
end
