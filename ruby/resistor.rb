class Resistor
  def initialize(first_color, second_color, third_color, fourth_color)
    @first_color = first_color
    @second_color = second_color
    @third_color = third_color
    @fourth_color = fourth_color

    @resistors = {
        'black' => ResistorStripe.new(nil, 0, 1, nil),
        'brown' => ResistorStripe.new(10, 1, 10, 1),
        'red' => ResistorStripe.new(20, 2, 100, 2),
        'orange' => ResistorStripe.new(30, 3, 1000, nil),
        'yellow' => ResistorStripe.new(40, 4, 10_000, nil),
        'green' => ResistorStripe.new(50, 5, 100_000, 0.5),
        'blue' => ResistorStripe.new(60, 6, 1_000_000, 0.25),
        'violet' => ResistorStripe.new(70, 7, 10_000_000, 0.1),
        'grey' => ResistorStripe.new(80, 8, 100_000_000, 0.05),
        'white' => ResistorStripe.new(90, 9, 1_000_000_000, nil),
        'gold' => ResistorStripe.new(nil, nil, 0.1, 5),
        'silver' => ResistorStripe.new(nil, nil, 0.01, 10),
        'blank' => ResistorStripe.new(nil, nil, nil, 20)
    }
  end

  def nominal_value
    first_value = @resistors[@first_color].first_value
    second_value = @resistors[@second_color].second_value
    multiplier = @resistors[@third_color].multiplier

    value = (first_value + second_value) * multiplier
  end

  def find_resistor(resistance)

  end

  def string_value
    return nominal_value.to_s if nominal_value < 1000
    return (nominal_value / 1000).to_s + "k" if nominal_value < 1_000_000
    return (nominal_value / 1_000_000).to_s + "M" if nominal_value < 1_000_000_000
    return (nominal_value / 1_000_000_000).to_s + "G"
  end

  def to_s
    @first_color.upcase + " " +
      @second_color.upcase + " " +
      @third_color.upcase + " " +
      @fourth_color.upcase + " "
  end

end

class ResistorStripe
  attr_reader :first_value, :second_value, :multiplier, :tolerance

  def initialize(first_value, second_value, multiplier, tolerance)
    @first_value = first_value
    @second_value = second_value
    @multiplier = multiplier
    @tolerance = tolerance
  end
end

def print_resistor(resistor)
  puts resistor.to_s + resistor.string_value + "Ω"
end

resistors = [
  Resistor.new('red', 'red', 'orange', 'gold'),
  Resistor.new('red', 'red', 'red', 'gold'),
  Resistor.new('brown', 'black', 'orange', 'gold'),
  Resistor.new('brown', 'black', 'brown', 'gold'),
  Resistor.new('brown', 'black', 'yellow', 'gold'),
  Resistor.new('yellow', 'violet', 'orange', 'gold'),
  Resistor.new('yellow', 'violet', 'brown', 'gold'),
  Resistor.new('brown', 'black', 'blue', 'gold'),
  Resistor.new('orange', 'white', 'red', 'silver'),
  Resistor.new('red', 'red', 'yellow', 'gold'),
  Resistor.new('red', 'red', 'brown', 'gold'),
  Resistor.new('yellow', 'violet', 'yellow', 'gold'),
  Resistor.new('brown', 'black', 'green', 'gold'),
  Resistor.new('brown', 'black', 'black', 'gold'),
  Resistor.new('yellow', 'violet', 'black', 'gold'),
  Resistor.new('red', 'red', 'green', 'gold'),
  Resistor.new('yellow', 'violet', 'green', 'gold'),
  Resistor.new('red', 'red', 'black', 'gold'),
  Resistor.new('yellow', 'violet', 'red', 'gold')
]

resistors.sort! { |x,y| x.nominal_value <=> y.nominal_value }
resistors.each { |resistor| print_resistor resistor }
