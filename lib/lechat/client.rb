module LeChat
  module Client
    def post_init
      EM.defer do
        loop do
          message = gets
          if message.strip == 'exit'
            puts "Disconnecting"
            break
          else
            send_data message
          end
        end
        close_connection true
      end
    end

    def receive_data data
      puts data
    end

    def unbind
      puts "Goodbye"
      EM.stop
    end
  end
end
