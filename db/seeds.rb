require_relative('../models/student')
require_relative('../models/house')
require('pry-byebug')

Student.delete_all()
House.delete_all()

house1 = House.new({
  "name" => "Gryffindor",
  "image" => "http://vignette1.wikia.nocookie.net/harrypotter/images/8/8e/0.31_Gryffindor_Crest_Transparent.png/revision/latest?cb=20161124074004"
  })

house2 = House.new({
  "name" => "Ravenclaw",
  "image" => "http://vignette2.wikia.nocookie.net/harrypotter/images/2/29/0.41_Ravenclaw_Crest_Transparent.png/revision/latest?cb=20161020182442"
  })

house3 = House.new({
  "name" => "Hufflepuff",
  "image" => "https://vignette2.wikia.nocookie.net/harrypotter/images/5/50/0.51_Hufflepuff_Crest_Transparent.png/revision/latest?cb=20161020182518"
  })

house4 = House.new({
  "name" => "Slytherin",
  "image" => "http://vignette4.wikia.nocookie.net/harrypotter/images/d/d3/0.61_Slytherin_Crest_Transparent.png/revision/latest?cb=20161020182557"
  })

house1.save()
house2.save()
house3.save()
house4.save()



student1 = Student.new({
  "first_name" => "Barry",
  "second_name" => "Totter",
  "house_id" => house1.id,
  "age" => "49"
  })
student2 = Student.new({
  "first_name" => "Derek",
  "second_name" => "Donnely",
  "house_id" => house2.id,
  "age" => "89"
  })
student3 = Student.new({
  "first_name" => "Sally",
  "second_name" => "Traffic",
  "house_id" => house3.id,
  "age" => "879"
  })
student4 = Student.new({
  "first_name" => "Matilda",
  "second_name" => "Ram",
  "house_id" => house4.id,
  "age" => "33"
  })
student1.save()
student2.save()
student3.save()
student4.save()

binding.pry
nil
