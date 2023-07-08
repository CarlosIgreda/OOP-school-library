require_relative 'nameable'

# Base Decorator
class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super() # Add super call here
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
