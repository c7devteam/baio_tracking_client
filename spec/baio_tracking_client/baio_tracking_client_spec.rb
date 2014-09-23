require 'spec_helper'

RSpec.describe BaioTrackingClient do
  describe 'setup' do
    context 'when dnot default configs' do
      it 'raise error' do
        described_class.clear_configs
        expect{ described_class.client }.to raise_error(BaioTrackingClient::NoConfigurationError)
      end
    end

    context 'when configuration is set' do
      before do
        described_class.clear_configs
        described_class.configure do |config|
          config.base_url = 'some_url'
          config.port = '8080'
          config.username = 'username'
          config.password = 'password'
        end
      end

      it 'return client' do
        expect(described_class.client).to be_kind_of(BaioTrackingClient::Client)
      end
    end
  end
end