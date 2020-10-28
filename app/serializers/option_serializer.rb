class OptionSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :Program
end
