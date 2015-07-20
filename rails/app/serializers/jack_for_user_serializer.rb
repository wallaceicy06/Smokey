class JackForUserSerializer < ActiveModel::Serializer
  attributes :id, :name
  # has_many :users, embed: :id, include: false
end
