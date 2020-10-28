class JoinerSerializer < ActiveModel::Serializer
  attributes :id
  has_one :School
  has_one :Option
end
