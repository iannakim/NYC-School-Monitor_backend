class School < ApplicationRecord
  belongs_to :neighborhood
  has_many :saveds, :dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :joiners, :dependent => :destroy

  #render school index in a-z order
  default_scope { order(name: :asc)}

end
