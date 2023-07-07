require_relative 'nameable'

# Person class modified to inherit from Nameable
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name = 'Unknown', age = nil, parent_permission: true)
    super() # Add super call here
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
