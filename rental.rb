# frozen_string_literal: true

require './person'
require './book'

class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rental << self

    @person = person
    person.rentals << self
  end
end
