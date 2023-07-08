require 'date'
require_relative 'person'
require_relative 'student'
require_relative 'book'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    puts 'Welcome to School Library App!'
  end

  def books_list
    @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
    puts
  end

  def people_list
    @people.each do |person|
      person_type = person.is_a?(Student) ? 'Student' : 'Teacher'
      print "[#{person_type}] "
      print "Name: #{person.name}, "
      print "ID: #{person.id}, "
      print "Age: #{person.age}"
      puts
    end
  end

  def add_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp.to_i

    case person_type
    when 1
      add_student
    when 2
      add_teacher
    else
      puts 'This option is not valid...Please try again'
    end
  end

  def add_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Parent Permission (Y/N): '
    parent_permission_input = gets.chomp.upcase

    parent_permission = parent_permission_input == 'y'

    student = Student.new(age, name, parent_permission: parent_permission)
    @people << student

    puts 'Person created successfully'
    puts
  end

  def add_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    @people << teacher

    puts 'Person created successfully'
    puts
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
    puts
  end

  def add_rental
    book_index = choose_book
    return unless book_index

    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |person, index|
      person_type = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts "#{index}) [#{person_type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i

    unless person_index.between?(0, @people.length)
      puts 'This option is not valid...Please try again'
      return
    end

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @people[person_index], @books[book_index])
    @rentals << rental

    puts 'Rental created successfully'
  end

  def choose_book
    puts 'Select a book from the following list by number:'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }

    book_index = gets.chomp.to_i

    return book_index if book_index.between?(0, @books.length)

    puts 'This option is not valid...Please try again'
    nil
  end

  def rentals_list(person_id)
    person = @people.find { |p| p.id == person_id }

    if person.nil?
      puts "ID #{person_id} not found."
      return
    end

    rentals = @rentals.select { |rental| rental.person == person }

    if rentals.empty?
      puts 'Rentals:'
      puts
      return
    end

    puts 'Rentals:'

    rentals.each do |rental|
      book = rental.book
      puts "Date: #{rental.date}, Book \"#{book.title}\" by #{book.author}"
    end

    puts
  end

  def menu(option)
    options = {
      '1' => method(:books_list),
      '2' => method(:people_list),
      '3' => method(:add_person),
      '4' => method(:add_book),
      '5' => method(:add_rental),
      '6' => proc {
               print 'ID of person: '
               person_id = gets.chomp.to_i
               rentals_list(person_id)
             },
      '7' => method(:exit)
    }

    if options[option]
      options[option].call
    else
      puts 'This option is not valid...Please try again'
    end
  end

  def exit
    puts 'Thank you for using this app!'
    exit
  end

  def main
    puts
    puts 'Please choose and option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    option = gets.chomp

    menu(option)
    main
  end
end

app = App.new
app.main
