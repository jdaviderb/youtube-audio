# frozen_string_literal: true

RSpec.describe YoutubeAudio::ScriptParser do
  let(:script_raw) do
    File.open('./spec/fixtures/script_raw.js')
  end

  subject { described_class.new(script_raw.read) }

  describe '#player_response' do
    it 'returns a collection of YoutubeAudio::Format' do
      expect(subject.player_response)
        .to be_instance_of(YoutubeAudio::PlayerResponse)
      expect(subject.player_response.formats.length).to eq(16)
    end
  end
end
