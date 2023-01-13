require './lib/employee'
require './lib/department'
require './lib/budget'

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