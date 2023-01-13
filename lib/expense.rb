class Expense
  attr_reader :name, :employee, :cost

  def initialize(name, employee, cost)
    @name = name
    @employee = employee
    @cost = cost
  end

  
end