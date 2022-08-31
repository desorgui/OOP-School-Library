require './person'
require './book'

class Rental
    attr_reader :book, :person, :rentals
    attr_accessor :date
  
    def initialize(date, book, person)
        @date = date
        rentals = []
        
        @book = book
        book.rental << self

        @person = person
        person.rentals << self
    end
end
