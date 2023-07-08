require_relative 'decorator'

# TrimmerDecorator
class TrimmerDecorator < Decorator
  def correct_name
    super[0...10]
  end
end
