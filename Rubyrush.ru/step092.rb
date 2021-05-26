variable = 'variable'

class MyClass
  def initialize(value)
    @variable = value

  end
  def show_variable
    p "Show #{@variable}" if defined?(@variable)
    p "Show #{variable}" if defined?(variable)
  end
end

new_var = MyClass.new('is TRUE')

new_var.show_variable
p "Show #{@variable}" if defined?(@variable)
p "Show #{variable}" if defined?(variable)

p local_variables.include?(:variable)
p new_var.instance_variable_defined?("@variable")
