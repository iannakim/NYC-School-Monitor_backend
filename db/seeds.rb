Saved.delete_all
Joiner.delete_all
Option.delete_all
Program.delete_all
Review.delete_all
User.delete_all
School.delete_all
Neighborhood.delete_all
Borough.delete_all

Saved.reset_pk_sequence
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

#program is hardcoded with just three items
programlist = ["ell_programs", "advancedplacement_courses", "language_classes"]

programlist.uniq.each do |pro|
  newpro = Program.create!(name: pro)
  program_hash[pro] = newpro.id
end
puts program_hash



# ------------------ Seeding Option (that belongs to a specific program) ---------------------

# if the school has ell, ap, lang programs, (not empty), split the strings and save as an array of elements.
# Grab each item and save them as options under that specific program.

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

# replacing empty strings or null values with default values

schools_hash.each do |school|

  if !school["graduation_rate"]
    school["graduation_rate"] = "NA"
  end

  if !school["attendance_rate"]
    school["attendance_rate"] = "NA"
  end
  
  if !school["shared_space"]
    school["shared_space"] = "Information not available at this time. Please contact the school for more information"
  end
#--------------------------edge case
  if !school["extracurricular_activities"]
    extra = "NA. Please contact the school for more information"
  else
    extra = school["extracurricular_activities"]
  end
#--------------------------edge case
  if !school["language_classes"]    
    lang = "NA. Please contact the school for more information"
  else
    lang = school["language_classes"] 
  end
#--------------------------edge case
  if !school["advancedplacement_courses"]
    ap = "No Advanced Placement courses are offered at this school"
  else
    ap = school["advancedplacement_courses"] 
  end

  s = School.create!(
    neighborhood_id: Neighborhood.find_by(name: school["neighborhood"]).id,
    name: school["school_name"],
    address: school["primary_address_line_1"],
    city: school["city"],
    state: school["state_code"],
    zipcode: school["postcode"],
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
    accessibility: school["school_accessibility"],
    total_students: school["total_students"],
    graduation_rate: school["graduation_rate"],
    attendance_rate: school["attendance_rate"],
    extracurricular: extra,
    langclasses: lang,
    ellprograms: school["ell_programs"],
    apcourses: ap,
    longitude: school["longitude"],
    latitude: school["latitude"]
  )
  puts "- created #{school["school_name"]}"

  

# ------------------- Seeding Joiner -------------------------------------------------

  attr_list = ["ell_programs", "language_classes", "advancedplacement_courses"]

  attr_list.each{ |attr| 
    puts school[attr]
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


anna = User.create!(username: "Master", password: "abc123", email: "anna@gmail.com", role: "Parent")
cooper = User.create!(username:"Cooper", password: "abc123", email: "cooper@gmail.com", role: "Current Student")
kevin = User.create!(username: "Kevin", password: "abc123", email: "kevin@gmail.com", role: "Alumni")
bob = User.create!(username: "Bob", password: "abc123", email: "bob@gmail.com", role: "Teacher")
jessica = User.create!(username: "Jessica", password: "abc123", email: "jessica@gmail.com", role: "Teacher")

# ------------------ Seeding Review ------------------------------------------------

Review.create!(user_id: 1, school_id: 107, content: "My daughter attends this school and it's a quite nice school with supportive teachers. She loves all of her teachers and they help her with so many things like choosing college options, filling out for scholarships and etc. I only wish they didn't start so early at 7am.")
Review.create!(user_id: 2, school_id: 107, content: "The hallway is so dull. I wish we had lockers like other schools do. I have to carry all of my books to every class and they get very heavy. The teachers are alright, most care about you doing well and some are just blah. We have weekly tests for Math and Science which sucks. Wish we had a bigger basketball court.")
Review.create!(user_id: 3, school_id: 107, content: "I graduated from this school 10 years ago and the last time I visited, some of my favorite teachers have retired already. Great memories made here. Learned a lot and back then there were few gangs in the area but the teachers and the school staff made sure everyone was safe at all times. Wish they upgraded the gym and the library though.")
Review.create!(user_id: 4, school_id: 107, content: "I've been teaching at this school for 18 years. Great students who come from diverse backgrounds and the teachers are very passionate to make a difference here. Administration is all new and so they like to poke around and implement lots of changes which can be good if done the right way. Wish budgeting was better so we can buy new books for kids.")
Review.create!(user_id: 5, school_id: 107, content: "Wow, I'm a new teacher here (less than 2 years) and there is a lot of work to be done here. The teachers are amazing and loves what they do however the curriculum is so old and a lot of the faculty are not tech savvy. Good support system from the department but each runs very independently from another. There is definitely a room for growth here.")

puts "🌵🥯🌵🥯 YAY!! 🌵🥯🌵🥯 "