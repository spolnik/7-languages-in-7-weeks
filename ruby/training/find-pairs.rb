languages = {
  "ruby" => :ruby,
  "io" => :io,
  "prolog" => :prolog,
  "scala" => :scala,
  "erlang" => :erlang,
  "clojure" => :clojure,
  "haskell" => :haskell
}

craftsmans = {
  # "Georgi" => [:scala],
  # "Bartosz" => [:ruby],
  "GrzegorzGl" => [],
  "GrzegprzGu" => [:scala],
  # "Tomasz" => [:prolog],
  "Oleh" => [],
  # "Maciej" => [],
  # "Anton" => [:scala],
  "Evgeny" => [],
  "Denys" => [],
  # "Aleksander" => [],
  "Jacek" => [:ruby, :scala]
}

def validate_language(args, languages)
  language = languages[args[0]]

  raise Exception.new("Unsupported language: " + ARGV[0]) unless language

  puts
  puts ">> " + language.to_s + " <<"
  puts "========"

  language
end

def remove_trainer_if_odd_count(group)
  group.delete("Jacek") if group.length % 2 == 1
end

def find_hosts_for(group, language)
  group.select {|name,skills| skills.include?(language)}.keys.shuffle
end

def find_peers_for(group, hosts)
 (group.keys - hosts).shuffle
end

def balance_hosts_and_peers(hosts, peers)
  while peers.length > hosts.length do
    hosts << peers.slice!(rand(peers.length))
  end

  randomize(hosts)
  randomize(peers)
end

def randomize(group)
  group.shuffle!
end

def display_pairs(hosts, peers)
  puts "HOST <> PEER (we code on peer laptop)"
  for i in 0..hosts.length-1
    puts "Pair (" + (i+1).to_s + "): " + hosts[i] + " <> " + peers[i]
  end
end

def display_time_to_switch
  puts "========"
  puts "<< Time to switch: " + (rand(3..6) * 5).to_s + " min >>"
  puts
end

language = validate_language(ARGV, languages)

remove_trainer_if_odd_count(craftsmans)

hosts = find_hosts_for(craftsmans, language)
peers = find_peers_for(craftsmans, hosts)

balance_hosts_and_peers(hosts, peers)

display_pairs(hosts, peers)
display_time_to_switch
