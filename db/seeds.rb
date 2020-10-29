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

programlist = ["ell_programs", "advancedplacement_courses", "language_classes"]

programlist.uniq.each do |pro|
  newpro = Program.create!(name: pro)
  program_hash[pro] = newpro.id
end
puts program_hash



# ------------------ Seeding Option (that belongs to a specific program) ---------------------

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


  schools_hash.each do |school|
    if school.has_key? "language_classes"
      if school["language_classes"].include?(",") 
        school["language_classes"].split(', ').each{|t| 
          if !Option.find_by(name: t)
            Option.create!(program_id: Program.find_by(name: "language_classes").id, name: t)
            puts "- created Option #{t}"
          end
        }
      else
        if !Option.find_by(name: school["language_classes"])
          Option.create!(program_id: Program.find_by(name: "language_classes").id, name: school["language_classes"])
          puts "- created Option #{school["language_classes"]}"
        end
      end
    end
  end


# ------------------- Seeding School -------------------------------------------------

schools_hash.each do |school|

  if !school["school_accessibility_description"]
    school["school_accessibility_description"] = 0
  end

  if !school["attendance_rate"]
    school["attendance_rate"] = 0.0
  end
  
  if !school["extracurricular_activities"]
    school["extracurricular_activities"] = "Information not available at this time. Please check the school website."
  end

  s = School.create!(
    neighborhood_id: Neighborhood.find_by(name: school["neighborhood"]).id,
    name: school["school_name"],
    address: school["primary_address_line_1"],
    city: school["city"],
    state: school["state_code"],
    zipcode: school["zip"],
    grades: school["finalgrades"],
    overview: school["overview_paragraph"],
    start_time: school["start_time"],
    end_time: school["end_time"],
    phone: school["phone_number"],
    email: school["school_email"],
    website: school["website"],
    subway: school["subway"],
    bus: school["bus"],
    shared_space: school["shared_space"],
    accessibility: school["school_accessibility_description"],
    total_students: school["total_students"],
    graduation_rate: school["graduation_rate"],
    attendance_rate: school["attendance_rate"],
    extracurricular: school["extracurricular_activities"],
    longitude: school["longitude"],
    latitude: school["latitude"]
  )
  puts "- created #{school["school_name"]}"

  

# ------------------- Seeding Joiner -------------------------------------------------

  attr_list = ["ell_programs", "language_classes", "advancedplacement_courses"]

  attr_list.each{ |attr| 
    if school.has_key? attr
      if school[attr].include?(";") 
        school[attr].split('; ').each{|t| 
          j = Joiner.create!(option_id: Option.find_by(name: t).id, school_id: s.id)
          puts "- created Joiner #{j.id}"
        }
      elsif school[attr].include?(",") 
        school[attr].split(', ').each{|t| 
          j = Joiner.create!(option_id: Option.find_by(name: t).id, school_id: s.id)
          puts "- created Joiner #{j.id}"
        }
      else
        j = Joiner.create!(option_id: Option.find_by(name: school[attr]).id, school_id: s.id)
        puts "- created Joiner #{j.id}"
      end
    end
  }
  
end



# ------------------- Seeding User -------------------------------------------------


anna = User.create!(username: "master", password: "abc123", email: "anna@gmail.com", role: "admin")
cooper = User.create!(username:"cooper", password: "abc123", email: "cooper@gmail.com", role: "student")
kevin = User.create!(username: "kevin", password: "abc123", email: "kevin@gmail.com", role: "parent")





puts "🌵🥯🌵🥯 YAY!! 🌵🥯🌵🥯 "