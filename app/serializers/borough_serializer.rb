class BoroughSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :neighborhoods
end
