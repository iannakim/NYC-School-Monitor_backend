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


url = "https://data.cityofnewyork.us/resource/23z9-6uk9.json"
restClientResponseObject = RestClient.get(url)
jsonButItsAString = restClientResponseObject.body
schools_hash = JSON.parse(jsonButItsAString)

##this will hold the new data
boroughs = {}
neighborhoods = {}

boroughlist = []
neighborhoodborough = {}


##for each school, push the borough into the boroughlist array
##for each school, create a key/value inside neighborhoodborough hash
## key= neighborhood, value=borough

schools_hash.each do |school|
  boroughlist.push(school["borough"])
  neighborhoodborough[school["neighborhood"]] = school["borough"]
end


## eliminate duplicates, and for every borough, create a Borough instance with name
## for every borough, create a key/value inside boroughs hash
## key= borough name, value=borough id
boroughlist.uniq.each do |b|
  newboro = Borough.create!(name: b)
  boroughs[b] = newboro.id
end
puts boroughs



## keys of neighborhoodborough hash are the neighborhoods
## grab the values (boroughs) by calling the key of the hash
## for each key, create a new neighborhood by name and borough id 
## remember, boroughs is a hash with borough name and borough id.
## create key/value inside neighborhoods hash. key=neighborhood, value=neighborhood id

neighborhoodborough.keys.each do |n| ##
  b = neighborhoodborough[n]
  newnabe = Neighborhood.create!(name: n, borough_id: boroughs[b])
  neighborhoods[n] = newnabe.id
end
puts neighborhoods











# queens = Borough.create!(name: "Queens")
# brooklyn = Borough.create!(name: "Brooklyn")
# bronx = Borough.create!(name: "Bronx")
# manhattan = Borough.create!(name: "Manhattan")
# staten = Borough.create!(name: "Staten Island")

