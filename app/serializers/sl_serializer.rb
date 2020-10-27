class SlSerializer < ActiveModel::Serializer
  attributes :id
  has_one :school
  has_one :lang_class
end
