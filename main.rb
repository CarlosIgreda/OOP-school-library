require_relative 'app'

def books_list
  @app.books_list
end

def people_list
  @app.people_list
end

def add_person
  @app.add_person
end

def add_book
  @app.add_book
end

def add_rental
  @app.add_rental
end

def rentals_list(person_id)
  @app.rentals_list(person_id)
end

def exit_app
  @app.exit
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
    '7' => method(:exit_app)
  }
  if options[option]
    options[option].call
  else
    puts 'This option is not valid... Please try again'
  end
end

@app = App.new

def main
  puts
  puts 'Please choose an option by entering a number:'
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

main
