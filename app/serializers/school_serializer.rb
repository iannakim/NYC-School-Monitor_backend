class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :nameme, :address, :city, :zip, :state, :grades, :overview, :start_time, :end_time, :phone, :email, :website, :subway, :bus, :shared_space, :accessibility, :total_students, :graduation_rate, :attendance_rate, :extracurricular, :longitude, :latitude
  has_one :Neighborhood
end
