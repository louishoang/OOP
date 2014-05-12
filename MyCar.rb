class MyCar
  attr_accessor :color, :name
  attr_reader :year

  def initialize (name, year, color, model)
    self.name = name
    @year = year
    @color = color
    @model = model 
    @current_speed = 0
  end

  def break(number)
    @current_speed -= number
    puts "You push the break and slow down by #{number} mph."

  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and speed up by #{number} mph."
  end

  def shut_off
    @current_speed = 0
    puts "Shut off the engine. #{@current_speed} mph"
  end

  def current_speed
    puts "You are going at #{@current_speed} mph."
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint looks great."
  end


  def self.gas_mileage(gallons, miles)
    puts "This car can go #{miles/gallons} miles per gallons."
  end

  def to_s
    puts "My car is #{self.name} #{@model}, year #{self.year}, #{self.color}."
  end
end



bmw = MyCar.new('BMW', 2000, 'red', 'Series 3')
puts bmw.speed_up(70)
puts "Wow Fast start up ."
puts bmw.current_speed
puts bmw.break(20)
puts bmw.current_speed
puts bmw.shut_off
puts bmw.current_speed
puts bmw.color= ('blue')

puts bmw.year
puts bmw.spray_paint('yellow')
MyCar.gas_mileage(5, 571)

puts bmw
