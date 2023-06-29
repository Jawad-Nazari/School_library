require_relative 'app'

class Options
  def initialize
    @app = App.new(self)
  end
end

def main
  Options.new
end


main
