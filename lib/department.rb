class Department
  attr_reader :name, 
              :employees, 
              :expenses,
              :expense_list

  def initialize(name)
    @name = name
    @employees = []
    @expenses = 0
    @expense_list = []
  end

  def hire(employee)
    @employees << employee
  end

  def expense(cost)
    @expenses += cost
  end

  def add_expense(expense)
    if @employees.include?(expense.employee)
      expense(expense.cost)
      @expense_list << expense
    end
  end

  def total(employee)
    total = 0
    @expense_list.each do |expense|
      total += expense.cost if expense.employee == employee
    end
    total
  end

  def responsible(expense)
    @expense_list.include?(expense) ? expense.employee : "Expense not on list."
  end
end