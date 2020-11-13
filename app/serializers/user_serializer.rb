class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :role, :reviews
  has_many :reviews
end
