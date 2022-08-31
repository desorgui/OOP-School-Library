# frozen_string_literal: true

require './rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(label, author)
    @title = label
    @author = author
    @rentals = []
  end

  def add_rentals(rental)
    @rentals.push(rental)
    rental.book = self
  end
end
