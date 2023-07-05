require 'json'

class RentalManager
  attr_reader :rentals

  def initialize
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def list_all_rentals(person_id)
    @rentals.select { |rental| rental.person&.id == person_id }.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}, Person: #{rental.person.name}"
    end
  end

  def load_rentals_from_file(file_path)
    @rentals = if File.exist?(file_path)
                 JSON.parse(File.read(file_path), create_additions: true)
               else

                 []
               end
  end

  def save_rentals_to_file(file_path)
    File.open(file_path, 'w') do |file|
      file.truncate(0)
      file.write(JSON.pretty_generate(@rentals))
    end
  end
end
