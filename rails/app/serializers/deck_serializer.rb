class DeckSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :cards, embed: :id
end
