class SlSerializer < ActiveModel::Serializer
  attributes :id
  has_one :School
  has_one :LangClass
end
