class NeighborhoodSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :Borough
end
