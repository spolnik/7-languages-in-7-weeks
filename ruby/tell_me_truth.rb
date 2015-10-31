def tell_the_truth(options = {})
  if options[:profession] == :lawyer
    'it could be believed that this is almost certainly not false.'
  else
    true
  end
end

puts "tell_the_truth => #{tell_the_truth}"
puts "tell_the_truth( :profession => :lawyer) => #{tell_the_truth( :profession => :lawyer)}"
