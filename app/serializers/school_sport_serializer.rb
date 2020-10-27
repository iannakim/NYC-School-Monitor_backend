class SchoolSportSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :sses
end
