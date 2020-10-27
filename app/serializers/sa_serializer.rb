class SaSerializer < ActiveModel::Serializer
  attributes :id
  has_one :school
  has_one :ap_course
end
