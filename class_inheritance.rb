class Employee
  attr_reader :salary, :name
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    (salary) * multiplier
  end
  def inspect
    puts name  
  end

end

class Manager < Employee
  attr_accessor :managed_emps

  def initialize(name, title, salary, boss)
    super
    @managed_emps = []
  end

  def bonus(multiplier)
    sum = managed_emps.inject(managed_emps[0].salary) do |sum,emp| 
      sum + emp.salary
    end
    sum * multiplier
  end

  def add_managed_emp(*emps) # arg1, arg2 => [arg1, arg2] => [[args1, arg2]]
    self.managed_emps.concat(emps)
  end

  

end

if $PROGRAM_NAME == __FILE__

  ned = Manager.new("Ned", "Founder", 1000000, nil)
  darren = Manager.new("Darren", "TA Manager", 78000, ned)
  david = Employee.new("David", "TA", 10000, darren)
  shawna = Employee.new("Shawna", "TA", 12000, darren)

  ned.add_managed_emp(darren, david, shawna)
  darren.add_managed_emp(david, shawna)

  darren.managed_emps.each {|e| p e}
  # p darren.managed_emps

end