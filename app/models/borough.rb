class Borough < ApplicationRecord
  has_many :neighborhoods, :dependent => :destroy
end
