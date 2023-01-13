describe Expense do 

  it 'has name, employee and a cost' do
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    expense1 = Expense.new("New Keyboard", bobbi, 100)
    expect(expense1.name).to eq("New Keyboard")
    expect(expense1.employee).to eq(bobbi)
    expect(expense1.cost).to eq(100)
  end

  it 'can add expenses with a responsible employee' do
    budget = Budget.new("State of Colorado", 1876)
    customer_service = Department.new("Customer Service")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    steve = Employee.new({name: "Steve Guy", age: "35", salary: "$30000"})
    customer_service.hire(bobbi)
    customer_service.hire(steve)

    expense1 = Expense.new("New Keyboard", bobbi, 100)
    expense2 = Expense.new("Repair Work", steve, 500)

    customer_service.add_expense(expense1)
    customer_service.add_expense(expense2)
    expect(customer_service.expense_list).to eq([expense1, expense2])
    expect(customer_service.expenses).to eq(600)
  end

  it 'cannot add an expense if employee attached to expense is not on the list' do
    budget = Budget.new("State of Colorado", 1876)
    customer_service = Department.new("Customer Service")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
   

    expense1 = Expense.new("New Keyboard", bobbi, 100)

    customer_service.add_expense(expense1)
    expect(customer_service.expenses).to eq(0)
    expect(customer_service.expense_list).to eq([])
  end

  it 'can ask who is responsible' do
    budget = Budget.new("State of Colorado", 1876)
    customer_service = Department.new("Customer Service")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    customer_service.hire(bobbi)
    expense1 = Expense.new("New Keyboard", bobbi, 100)
    customer_service.add_expense(expense1)
    expect(customer_service.responsible(expense1)).to eq(bobbi)
  end

  it 'cannot have an expense be responsible if expense not added' do
    budget = Budget.new("State of Colorado", 1876)
    customer_service = Department.new("Customer Service")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    customer_service.hire(bobbi)
    expense1 = Expense.new("New Keyboard", bobbi, 100)
    expect(customer_service.responsible(expense1)).to eq("Expense not on list.")
  end

  it 'can total expenses for a given employee' do
    budget = Budget.new("State of Colorado", 1876)
    customer_service = Department.new("Customer Service")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    steve = Employee.new({name: "Steve Guy", age: "35", salary: "$30000"})
    customer_service.hire(bobbi)
    customer_service.hire(steve)

    expense1 = Expense.new("New Keyboard", bobbi, 100)
    expense2 = Expense.new("Repair Work", steve, 500)
    expense3 = Expense.new("New Mouse", bobbi, 110)

    customer_service.add_expense(expense1)
    customer_service.add_expense(expense2)
    customer_service.add_expense(expense3)
    expect(customer_service.total(bobbi)).to eq(210)
    expect(customer_service.total(steve)).to eq(500)
  end

end