require './lib/employee'
require './lib/department'
require './lib/budget'
require './lib/expense'

describe Employee do
  
  it ' has a name' do
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    expect(bobbi.name).to eq("Bobbi Jaeger")  
  end

  it 'has an age' do
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    expect(bobbi.age).to eq(30)
  end

  it 'has a salary' do
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    expect(bobbi.salary).to eq(100000)
  end

  it 'can give a raise' do
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    bobbi.give_raise(5000)
    expect(bobbi.salary).to eq(105000)
  end
end

describe Department do 

  it 'has a name' do
    customer_service = Department.new("Customer Service")    
    expect(customer_service.name).to eq("Customer Service")
  end

  it 'has employees blank' do
    customer_service = Department.new("Customer Service")    
    expect(customer_service.employees).to eq([])
  end

  it 'it can hire and have more employees' do
    customer_service = Department.new("Customer Service")    
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})  
    customer_service.hire(bobbi)
    customer_service.hire(aaron) 
    expect(customer_service.employees).to eq([bobbi, aaron])
  end

  

  it 'has expenses' do
    customer_service = Department.new("Customer Service")    
    expect(customer_service.expenses).to eq(0)# => 0
    customer_service.expense(100)
    customer_service.expense(25)
    expect(customer_service.expenses).to eq(125)# => 125
  end
end

describe Budget do

  it 'has a year' do
    budget = Budget.new("State of Colorado", 1876)
    expect(budget.year).to eq(1876)
  end

  it 'has a list of departments' do
    budget = Budget.new("State of Colorado", 1876)
    expect(budget.departments).to eq([])
    customer_service = Department.new("Customer Service")    
    accounting = Department.new("Accounting")    
    budget.add_department(customer_service)
    budget.add_department(accounting)
    expect(budget.departments).to eq([customer_service, accounting])
  end

  it 'can list departments with expenses less than $500' do
    budget = Budget.new("State of Colorado", 1876)
    expect(budget.departments).to eq([])
    customer_service = Department.new("Customer Service")
    customer_service.expense(500)
    accounting = Department.new("Accounting")    
    budget.add_department(customer_service)
    budget.add_department(accounting)
    expect(budget.cheap_depts).to eq([accounting])
  end

  it 'can list all employees salaries' do 
    budget = Budget.new("State of Colorado", 1876)
    customer_service = Department.new("Customer Service")
    accounting = Department.new("Accounting") 
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    steve = Employee.new({name: "Steve Guy", age: "35", salary: "$30000"})
    customer_service.hire(bobbi)
    accounting.hire(steve)
    budget.add_department(customer_service)
    budget.add_department(accounting)
    expect(budget.salaries).to eq({bobbi => 100000, steve => 30000})
  end
end

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