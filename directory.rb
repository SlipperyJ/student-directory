def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
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
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  puts "enter a letter to filter by intial, or leave blank for no filter"
  @letter = gets.chomp!
  students = letter_filter(students, @letter)


  index = 0
  while index < students.length do
      puts "#{index}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
      index += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
