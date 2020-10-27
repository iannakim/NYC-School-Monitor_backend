class ApCourse < ApplicationRecord
  has_many :sas, :dependent => :destroy
end
