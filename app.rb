require './book'
require './rental'
require './student'
require './teacher'

class App # rubocop:disable Metrics/ClassLength
  def initialize
    @people_list = []
    @books_list = []
    @rentals_list = []
  end

  def run_program
    puts '[a] Create a person'
    puts '[b] Create a book'
    puts '[c] Create a rental'
    puts '[d] List all persons'
    puts '[e] List all books'
    puts '[f] List all rentals'
    puts '[g] Exit'
    puts
    print 'Enter the letter corresponding to the operation you want to perform: '
    user_choice = gets.chomp
    operator(user_choice)
  end

  def operator(user_choice)
    case user_choice
    when 'a'
      create_person
    when 'b'
      create_book
    when 'c'
      create_rental
    when 'd'
      list_person
    when 'e'
      list_books
    when 'f'
      list_rentals
    else
      exit
    end
  end

  def list_books
    if @books_list.length.zero?
      p 'There is no books to show, Add new one'
    else
      @books_list.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    run_program
  end

  def list_person
    if @people_list.length.zero?
      p 'There is no people to show, Add new one'
    else
      @people_list.each do |person|
        p "Person ID: #{person.id}, Name: #{person.name} (#{person.class.name}), Age: #{person.age}"
        puts
      end
    end
    run_program
  end

  def create_person
    p 'What do you want to create?'
    puts '[1] Student'
    puts '[2] Teacher'
    print 'Enter number: '
    puts
    choice = gets.chomp
    case choice
    when '1' then add_student
    when '2' then add_teacher
    else puts 'Please enter a valid input, it must be the number 1 or the number 2'
         puts
    end
    create_person
  end

  def add_student
    print 'Student classroom: '
    classroom = gets.chomp.to_i
    print 'Student name: '
    name = gets.chomp
    print 'Student age: '
    age = gets.chomp.to_i
    print 'Has Parent permission? [Y/N]: '
    input = gets.chomp.downcase
    valid_permission = input == 'y'
    @people_list.push(Student.new(classroom, age, name, parent_permission: valid_permission))
    p 'Student created'
    puts
    run_program
  end

  def add_teacher
    print 'Teacher age: '
    age = gets.chomp.to_i
    print 'Teacher name: '
    name = gets.chomp
    print 'Teacher specialization: '
    specialization = gets.chomp
    @people_list.push(Teacher.new(age, name, specialization))
    p 'Teacher created'
    puts
    run_program
  end

  def create_book
    print 'Book title: '
    title = gets.chomp
    print 'Book author: '
    author = gets.chomp
    @books_list.push(Book.new(title, author))
    p 'Book created'
    puts
    run_program
  end

  def create_rental #rubocop:disable Metrics/ClassLength
    index_arr = []
    index = nil
    p 'Please select a book: '
    @books_list.each_with_index do |book, i|
      index_arr.push(i)
      puts "[#{i}] #{book.title}. By: #{book.author}"
    end
    until index_arr.include?(index)
      puts
      print 'Choose The correct book number: '
      index = gets.chomp.to_i
      book = @books_list[index]
    end
    index_arr = []
    puts
    p 'Please select the correct person number'
    @people_list.each_with_index do |person, i|
      index_arr.push(i)
      puts "[#{i}] Name: #{person.name} (#{person.class.name})"
    end
    until index_arr.include?(index)
      print 'Choose person number: '
      index = gets.chomp.to_i
      person = @people_list[index]
    end
    print 'Date of rental (dd-mm-yyyy): '
    date = gets.chomp
    @rentals_list.push(Rental.new(date, book, person))
    p 'Rental data created'
    puts
    run_program
  end

  def list_rentals #rubocop:disable Metrics/ClassLength
    puts
    if @rentals_list.length.zero?
      p 'There is no rentals to show, Add new one'
      puts
      run_program
    else
      print "Enter person's id: "
      id = gets.chomp.to_i
      @people_list.each do |person|
        if person.id == id
          person.rentals.each do |rental|
            p "Book title: #{rental.book.title}, Rental date: #{rental.date}"
            puts
          end
          run_program
        else
          puts
          p 'There are no rentals data for that id'
          puts
        end
        run_program
      end
    end
  end

  def exit
    puts
    p 'Thank you for using our program'
  end
end
