require 'rspec'
require_relative '../lib/lechat'

describe LeChat::Server do
  let(:server) { LeChat::Server.new 1 }
  describe '#post_init' do
    it 'logs that someone connected' do
      $stdout.should_receive(:puts).with "someone connected"
      server.post_init
    end
  end
end
