class School < ApplicationRecord
  belongs_to :neighborhood
  has_many :reviews
  has_many :sas
  has_many :ses
  has_many :sses
  has_many :sls
end
