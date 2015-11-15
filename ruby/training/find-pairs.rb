languages = {
  "ruby" => :ruby,
  "io" => :io,
  "prolog" => :prolog,
  "scala" => :scala,
  "erlang" => :erlang,
  "clojure" => :clojure,
  "haskell" => :haskell
}

language = languages[ARGV[0]]
raise Exception.new("Unsupported language: " + ARGV[0]) unless language

puts
puts ">> " + language.to_s + " <<"
puts "========"

craftsmans = {
  "Georgi" => [:scala],
  "Bartosz" => [],
  "GrzegorzGl" => [],
  "GrzegprzGu" => [],
  "Tomasz" => [],
  "Oleh" => [],
  "Maciej" => [],
  "Anton" => [],
  "Evgeny" => [],
  "Denys" => [],
  "Aleksander" => [],
  "Jacek" => [:ruby, :scala]
}

craftsmans.delete("Jacek") if craftsmans.length % 2 == 1

hosts = craftsmans.select {|name,skills| skills.include?(language)}.keys.shuffle
peers = craftsmans.reject {|name,skills| skills.include?(language)}.keys.shuffle

while peers.length > hosts.length do
  hosts << peers.slice!(rand(peers.length))
end

hosts.shuffle!
peers.shuffle!

for i in 0..hosts.length-1
  puts "Pair (" + (i+1).to_s + "): " + hosts[i] + " <> " + peers[i]
end

puts "========"
puts "<< Time to switch: " + (rand(3..6) * 5).to_s + " min >>"
puts
