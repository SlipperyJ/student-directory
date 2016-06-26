def input_students
  puts " Please enter the names of the students ".center(95, '*-')
  puts " To finish, just hit return twice ".center(95, '-*')
  name = gets.chomp
  questions(name)
end

def questions(name)
  students = []

  while !name.empty? do
    puts "Please enter a hobby".center(95)
    hobby = gets.chomp
    puts "Please enter country of birth".center(95)
    birth_country = gets.chomp
    puts "Please enter height".center(95)
    height = gets.chomp
    students << {name: name, cohort: :november, hobby: hobby, birth_country:
                 birth_country, height: height}
    puts "Now we have #{students.count} students"
    puts "Please enter another name".center(95, '-*')
    puts "To finish, just hit return twice".center(95, '-*')
    name = gets.chomp
  end
  students
end


def letter_filter(students, letter)
  students = students.select do |student, letter|
    student[:name].upcase[0] == @letter.upcase[0]
  end
end

def name_restrictions(students)
  students.select! do |student|
    student[:name].length < 12
  end
end

def print_header
  puts "The students of Villains Academy".center(95)
  puts "-------------".center(95)
end

def print(students)
  puts "enter a letter to filter by intial, or leave blank for no filter".center(95)
  @letter = gets.chomp!
  students = letter_filter(students, @letter)

  index = 0
  while index < students.length do
      puts "#{index}. #{students[index][:name]} #{students[index][:hobby]} #{students[index][:birth_country]} #{students[index][:height]} (#{students[index][:cohort]} cohort)"
      index += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(95)
end

students = input_students
print_header
print(students)
print_footer(students)
