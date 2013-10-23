require 'eventmachine'
require_relative 'lechat/server'
require_relative 'lechat/client'

module LeChat

  def self.start_server port=9999
    if EM.reactor_running?
      spaghetti
    else
      EM.run { EM.start_server 'localhost', port, Server }
    end
  end

  def self.start_client port=9999
    if EM.reactor_running?
      spaghetti
    else
      EM.run { EM.connect 'localhost', port, Client }
    end
  end

  def self.spaghetti
    puts "The Reactor has already been started! Check your spaghetti!"
  end
end
