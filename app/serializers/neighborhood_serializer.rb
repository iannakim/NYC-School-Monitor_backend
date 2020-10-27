class NeighborhoodSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :borough
  has_many :schools
end
