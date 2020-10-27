class School < ApplicationRecord
  belongs_to :neighborhood
  has_many :reviews, :dependent => :destroy
  has_many :sas, :dependent => :destroy
  has_many :ses, :dependent => :destroy
  has_many :sses, :dependent => :destroy
  has_many :sls, :dependent => :destroy
end
