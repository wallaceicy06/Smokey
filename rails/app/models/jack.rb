class Jack < ActiveRecord::Base
  belongs_to :deck
  has_many :jack_invitations
  has_many :invited_users, through: :jack_invitations, source: :user
  validates :name, presence: true
  validates :deck, presence: true
end
