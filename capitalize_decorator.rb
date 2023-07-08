require_relative 'decorator'

# CapitalizeDecorator
class CapitalizeDecorator < Decorator
  def correct_name
    super.capitalize
  end
end
