Joiner.delete_all
Option.delete_all
Program.delete_all
Review.delete_all
User.delete_all
School.delete_all
Neighborhood.delete_all
Borough.delete_all

Joiner.reset_pk_sequence
Option.reset_pk_sequence
Program.reset_pk_sequence
Review.reset_pk_sequence
User.reset_pk_sequence
School.reset_pk_sequence
Neighborhood.reset_pk_sequence
Borough.reset_pk_sequence

# ------------------ Turn Obj into a workable hash -------------------------------------
url = "https://data.cityofnewyork.us/resource/23z9-6uk9.json"
restClientResponseObject = RestClient.get(url)
jsonButItsAString = restClientResponseObject.body
schools_hash = JSON.parse(jsonButItsAString)



# ------------------ Seeding Borough ---------------------------------------------------
borough_hash = {}
neighborhood_hash = {}
boroughlist = []
neighborhood_borough = {}

##for each school, push the borough into the boroughlist array
##for each school, create a key/value inside neighborhood_borough hash
## key= neighborhood, value=borough

schools_hash.each do |school|
  boroughlist.push(school["borough"])
  neighborhood_borough[school["neighborhood"]] = school["borough"]
end


## eliminate duplicates, and for every borough, create a Borough instance with name
## for every borough, create a key/value inside borough hash
## key= borough name, value=borough id
boroughlist.uniq.each do |b|
  newboro = Borough.create!(name: b)
  borough_hash[b] = newboro.id
end
puts borough_hash



# ------------------ Seeding Neighborhood (that belongs to a Borough) ---------------------

## keys of neighborhood_borough hash are the neighborhood
## grab the values (boroughs) by calling the key of the hash
## for each key, create a new neighborhood by name and borough id 
## remember, boroughs is a hash with borough name and borough id.
## create key/value inside neighborhood hash. key=neighborhood, value=neighborhood id

neighborhood_borough.keys.each do |n| ##
  b = neighborhood_borough[n]
  newnabe = Neighborhood.create!(name: n, borough_id: borough_hash[b])
  neighborhood_hash[n] = newnabe.id
end
puts neighborhood_hash




# ------------------ Seeding Program ----------------------------------------------
program_hash = {}
option_hash = {}
option_program_hash = {}

programlist = ["ell_programs", "school_sports", "advancedplacement_courses", "language_classes"]

programlist.uniq.each do |pro|
  newpro = Program.create!(name: pro)
  program_hash[pro] = newpro.id
end
puts program_hash



# ------------------ Seeding Option (that belongs to a Program) ---------------------

schools_hash.each do |school|
  if school["ell_programs"] != ""
    if school["ell_programs"].include?(";") 
      school["ell_programs"].split('; ').each{|t| 
        if !Option.find_by(name: t)
          Option.create!(program_id: Program.find_by(name: "ell_programs").id, name: t)
          puts "- created Option #{t}"
        end
      }
    else
      if !Option.find_by(name: school["ell_programs"])
        Option.create!(program_id: Program.find_by(name: "ell_programs").id, name: school["ell_programs"])
        puts "- created Option #{school["ell_programs"]}"
      end
    end
  end
end


  schools_hash.each do |school|
    if school.has_key? "advancedplacement_courses"
      if school["advancedplacement_courses"].include?(",") 
        school["advancedplacement_courses"].split(', ').each{|t| 
          if !Option.find_by(name: t)
            Option.create!(program_id: Program.find_by(name: "advancedplacement_courses").id, name: t)
            puts "- created Option #{t}"
          end
        }
      else
        if !Option.find_by(name: school["advancedplacement_courses"])
          Option.create!(program_id: Program.find_by(name: "advancedplacement_courses").id, name: school["advancedplacement_courses"])
          puts "- created Option #{school["advancedplacement_courses"]}"
        end
      end
    end
  end











# queens = Borough.create!(name: "Queens")
# brooklyn = Borough.create!(name: "Brooklyn")
# bronx = Borough.create!(name: "Bronx")
# manhattan = Borough.create!(name: "Manhattan")
# staten = Borough.create!(name: "Staten Island")





puts "🌵🥯 YAY!! 🌵🥯 "