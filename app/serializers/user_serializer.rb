class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :role, :reviews, :saveds
  has_many :reviews
  has_many :saveds
end
