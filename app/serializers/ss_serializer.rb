class SsSerializer < ActiveModel::Serializer
  attributes :id
  has_one :School
  has_one :SchoolSport
end
