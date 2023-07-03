class RentalManager
  def initialize
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def list_all_rentals(person_id)
    @rentals.select { |rental| rental.person.id == person_id }.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}, Person: #{rental.person.name}"
    end
  end
end
