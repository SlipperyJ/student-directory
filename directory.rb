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
    student[:name].upcase[0] == letter.upcase[0]
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
  puts "enter a letter to filter by intial"
  initial = gets.chomp!.upcase
  students.each_with_index do |student, index|
    if student[:name].upcase[0] == initial && student[:name].length < 12
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
