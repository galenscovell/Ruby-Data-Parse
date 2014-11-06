

require 'csv'


puts "Data Parser Initialized."


contents = CSV.foreach('event_attendees_full.csv') do |row|
    puts row.inspect
end

printf "Search term: "
search_term = gets.chomp




