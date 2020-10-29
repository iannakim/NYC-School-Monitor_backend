class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :zipcode, :state, :grades, :overview, :start_time, :end_time, :phone, :email, :website, :subway, :bus, :shared_space, :accessibility, :total_students, :graduation_rate, :attendance_rate, :ellprograms, :langclasses, :apcourses, :extracurricular, :longitude, :latitude
  has_one :neighborhood
  has_many :joiners 
  has_many :reviews

end
