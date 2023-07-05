require 'json'

class Storage
  @file_extension = 'json'
  @base_url = './'

  def self.save_data(class_name, object)
    file_path = "#{@base_url}#{class_name}.#{@file_extension}"
    File.open(file_path, 'w') do |file|
      file.truncate(0) 
      file.write(JSON.pretty_generate(object))
    end
  end

  def self.load_data(class_name)
    file_path = "#{@base_url}#{class_name}.#{@file_extension}"

    return [] unless File.exist?(file_path)

    begin
      data_from_file = File.read(file_path)
      JSON.parse(data_from_file, create_additions: true)
    rescue JSON::ParserError => e
      puts "Error parsing JSON file: #{file_path}"
      puts e.message
      []
    end
  end
end
