require_relative 'person'
require_relative 'classroom'
require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'

# Testing

# Person
person = Person.new(19, 'maximilianus')
puts 'Person:'
puts "Name: #{person.correct_name}"
puts "Age: #{person.age}"
puts "Can use services? #{person.can_use_services?}"
puts

# Decorator
capitalized_person = CapitalizeDecorator.new(person)
puts 'Capitalized Person:'
puts "Correct name: #{capitalized_person.correct_name}"
puts

# TrimmerDecorator
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts 'Capitalized and Trimmed Person:'
puts "Correct name: #{capitalized_trimmed_person.correct_name}"
puts

# Classroom
classroom = Classroom.new('Classroom 5')
puts 'Classroom:'
puts "Label: #{classroom.label}"
puts

# Student
student = Student.new(16, classroom, 'Carlos')
puts 'Student:'
puts "Name: #{student.name}"
puts "Age: #{student.age}"
puts "Can use services? #{student.can_use_services?}"
puts "Classroom: #{student.classroom.label}"
puts "Play hooky: #{student.play_hooky}"
puts "Student's Classroom: #{student.classroom.label}"
puts 'Students in the Classroom:'
classroom.students.each do |student_each|
  puts "- #{student_each.name}"
end
puts

# Teacher
teacher = Teacher.new(32, 'Chemistry', 'Mr. Jones')
puts 'Teacher:'
puts "Name: #{teacher.correct_name}"
puts "Age: #{teacher.age}"
puts "Can use services? #{teacher.can_use_services?}"
puts

# Books
book = Book.new('Metamorphosis', 'Franz Kafka')
puts 'Book:'
puts "Title: #{book.title}"
puts "Author: #{book.author}"
puts

book2 = Book.new('Ulysses', 'James Joyce')
puts 'Book:'
puts "Title: #{book.title}"
puts "Author: #{book.author}"
puts

# Rentals
rental = Rental.new('01-01-2000', person, book)
puts 'Rental:'
puts "Date: #{rental.date}"
puts "Book title: #{rental.book.title}"
puts "Person name: #{rental.person.correct_name}"
puts

rental = Rental.new('08-02-2001', person, book2)
puts 'Rental:'
puts "Date: #{rental.date}"
puts "Book title: #{rental.book.title}"
puts "Person name: #{rental.person.correct_name}"
puts

# Printing all rentals
puts "All rentals for #{person.name}:"
person.rentals.each do |rental_item|
  puts "#{rental_item.book.title} -> #{rental_item.date}"
end
puts
