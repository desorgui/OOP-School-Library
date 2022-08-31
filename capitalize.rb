# frozen_string_literal: true

require './decorator'

class CapitalizeDecorator < Decorator
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end
