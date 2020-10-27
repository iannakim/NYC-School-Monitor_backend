class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :email, :role
  has_many :reviews
end
