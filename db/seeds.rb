Sl.delete_all
Sa.delete_all
Ss.delete_all
Se.delete_all
LangClass.delete_all
ApCourse.delete_all
SchoolSport.delete_all
EllProgram.delete_all
Review.delete_all
User.delete_all
School.delete_all
Neighborhood.delete_all
Borough.delete_all


Sl.reset_pk_sequence
Sa.reset_pk_sequence
Ss.reset_pk_sequence
Se.reset_pk_sequence
LangClass.reset_pk_sequence
ApCourse.reset_pk_sequence
SchoolSport.reset_pk_sequence
EllProgram.reset_pk_sequence
Review.reset_pk_sequence
User.reset_pk_sequence
School.reset_pk_sequence
Neighborhood.reset_pk_sequence
Borough.reset_pk_sequence

boroughs = {}
boroughlist = ["Queens", "Brooklyn", "Bronx", "Manhattan", "Staten Island"]

boroughlist.each do |b|
  newboro = Borough.create!(name: b)
  
  boroughs[b] = newboro.id
end

puts boroughs









# queens = Borough.create!(name: "Queens")
# brooklyn = Borough.create!(name: "Brooklyn")
# bronx = Borough.create!(name: "Bronx")
# manhattan = Borough.create!(name: "Manhattan")
# staten = Borough.create!(name: "Staten Island")

