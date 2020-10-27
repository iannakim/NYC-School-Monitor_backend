class SsSerializer < ActiveModel::Serializer
  attributes :id
  has_one :school
  has_one :school_sport
end
