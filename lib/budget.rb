class Budget
  attr_reader :name,
              :year, 
              :departments

  def initialize(name, year)
    @name = name
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def cheap_depts
    @departments.select{ |department| department.expenses < 500 }
  end

  def salaries
    hash = {}
    @departments.each do |department|
      department.employees.each { |employee| hash[employee]= employee.salary }
    end
    hash
  end
end