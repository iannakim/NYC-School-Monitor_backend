class LangClass < ApplicationRecord
  has_many :sls, :dependent => :destroy
end
