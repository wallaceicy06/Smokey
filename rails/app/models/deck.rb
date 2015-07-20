class Deck < ActiveRecord::Base
  has_many :cards, dependent: :delete_all
  has_many :jacks

  validates :name, presence: true
end
