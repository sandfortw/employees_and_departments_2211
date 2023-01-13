class Employee
  attr_reader :name, 
              :age, 
              :salary

  def initialize(attributes)
    @name = attributes[:name]
    @age = attributes[:age].to_i
    @salary =attributes[:salary].delete("$").to_i
  end

  def give_raise(raise)
    @salary += raise 
  end
end