module LeChat
  class Server < EM::Connection
    attr_reader :name

    @@clients = []

    def post_init
      puts "someone connected"
      send_data "Welcome to chat\nWhat is your name?\n"
    end

    def unbind
      send_to_others "#{name} has disconnected\n"
      @@clients.delete self
      puts "#{name} has disconnected"
    end

    def receive_data data
      if data.strip == "exit"
        send_data "Goodbye\n"
        close_connection true
      else
        if @name
          send_to_others "#{name}: #{data}"
        else
          @name = data.strip
          connect_user
        end
      end
    end

    private

    def connect_user
      send_data "Hello #{name}\n"
      send_to_others "#{name} has connected\n"
      @@clients << self
      puts "#{name} has connected"
    end

    def send_to_others message
      @@clients.each do |client|
        client.send_data message unless client == self
      end
    end

  end
end
