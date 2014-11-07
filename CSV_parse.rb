

require 'csv'

puts "Data Parser Initialized."


def save_output(file, searched, term)
    Dir.mkdir("searches") unless Dir.exists?("searches")
    filename = "searches/#{term}.txt"

    File.open(filename, 'w') do |file|
        file.puts searched
    end
    puts "Output saved to /searches as #{term}.txt."
end


def search_data(file, term)
    searched_data = []
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
        if row[:first_name] == term
            searched_data << row
        end
    end
    save_output(file, searched_data, term)
end

contents = "event_attendees_full.csv"

printf "Search term: "
search_key = gets.chomp

search_data(contents, search_key)



