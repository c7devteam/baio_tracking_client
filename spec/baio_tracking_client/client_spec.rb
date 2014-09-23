require 'spec_helper'

RSpec.describe BaioTrackingClient::Client do
  let(:params) do
    {
      browser: 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',
      name: 'page_view',
      owner_id: '1',
      referrer: 'www.google.lv',
      session_id:'some_string',
      url: "/system/packages",
      tags: ["tag1", "tag2"]
    }
  end

  before do
    BaioTrackingClient.configure do |config|
      config.base_url = 'localhost'
      config.port = '3000'
      config.username = 'username'
      config.password = 'password'
    end
  end

  describe '#post' do
    it 'post data' do
      VCR.use_cassette('post_event') do
        expect(described_class.new.post_event(params: params).status).to eq(200)
      end
    end
  end

  describe 'initialize' do
    context 'saccsses' do
      BaioTrackingClient::Configuration::ATTRIBUTES.map do |key|
        it 'it set #{key.to_s}' do
          expect(described_class.new.send(key)).to include(BaioTrackingClient.send(key))
        end
      end
    end

    context 'when lost some key' do
      before do
        BaioTrackingClient.clear_configs
      end

      BaioTrackingClient::Configuration::ATTRIBUTES.map do |key|
        it 'raise error #{key.to_s}' do
          expect{ described_class.new.send(key) }.to raise_error(BaioTrackingClient::NoConfigurationError)
        end
      end
    end
  end
end