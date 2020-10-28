class School < ApplicationRecord
  belongs_to :neighborhood
  has_many :reviews, :dependent => :destroy
  has_many :joiners, :dependent => :destroy
end
