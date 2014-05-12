module Towable
  def tow
    puts "This vehicle can tow. "
  end
end

class Vehicle
  @@number_of_vehicles = 0

  attr_accessor :color
  attr_reader :year
  attr_reader :model

  def self.gas_mileage(gallons, miles)
    puts "This car can go #{miles/gallons} miles per gallons."
  end

  def self.number_of_vehicles
    puts "there is #{@@number_of_vehicles} vehicles."
  end

  def initialize (year, color, model)
    @year = year
    @color = color
    @model = model 
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def break(number)
    @current_speed -= number
    puts "You push the break and slow down by #{number} mph."

  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and speed up by #{number} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Shut down the engine. #{@current_speed} mph"
  end

  def current_speed
    puts "You are going at #{@current_speed} mph."
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint looks great."
  end
  

end

class MyCar < Vehicle
  NUMBER_OF_DOOR = 4

  def to_s
    puts "My car is #{model}, year #{year}, #{color}."
  end

end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOOR = 2

  def to_s
    puts "My truck is #{model}, year #{year}, #{color}."
  end
end



bmw = MyCar.new('2000', 'red', 'BMW')
titan = MyTruck.new('2010', 'grey', 'Nissan titan')

puts bmw
puts titan
puts Vehicle.number_of_vehicles

