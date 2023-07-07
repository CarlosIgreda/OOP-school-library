# Interface
class Nameable
  def correct_name
    raise NotImplementedError, "Subclasses must implement 'correct_name' method"
  end
end

# Person class modified to inherit from Nameable
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name = 'Unknown', age = nil, parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age&.to_i&.>= 18
  end

  def generate_id
    Random.rand(1..500)
  end
end

# Base Decorator
class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# CapitalizeDecorator
class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end

# TrimmerDecorator
class TrimmerDecorator < Decorator
  def correct_name
    super[0...10]
  end
end

person = Person.new('maximilianus', 22)
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
