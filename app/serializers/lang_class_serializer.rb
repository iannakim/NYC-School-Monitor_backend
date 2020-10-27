class LangClassSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :sls
end
