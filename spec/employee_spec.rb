require './lib/employee'
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