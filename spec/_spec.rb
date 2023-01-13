require './lib/employee'
require './lib/department'
require './lib/budget'

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

  end

  it 'has a list of departments' do

  end

  it 'can list departments with expenses less than $500' do

  end

  it 'can list all employees salaries' do 
    
  end
end