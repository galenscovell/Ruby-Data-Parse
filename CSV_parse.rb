

require 'csv'

puts "Data Parser Initialized."


def save_output(searched, term)
    current_time = Time.now.strftime('%m_%d_%y')
    Dir.mkdir("searches") unless Dir.exists?("searches")
    filename = "searches/#{current_time}_#{term}.txt"

    File.open(filename, 'w') do |file|
        file.puts searched
    end

    puts "Output saved to /searches as '#{current_time}_#{term}.txt'."
end


def search_data(file, term)
    searched_data = []
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
        id_num = row[0]
        if row[:first_name] == term
            searched_data << row
            searched_data << [""]
        end
    end
    save_output(searched_data, term)
end

contents = "event_attendees_full.csv"

end_script = false
until end_script
    printf "Search term ('quit' to end): "
    search_key = gets.chomp    
    if search_key != 'quit'
        search_data(contents, search_key)
    else
        end_script = true
    end
end
puts 'Closing Data Parser.'



