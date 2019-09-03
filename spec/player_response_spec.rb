# frozen_string_literal: true

RSpec.describe YoutubeAudio::PlayerResponse do
  let(:response_raw) do
    JSON.parse(
      {
        streamingData: {
          adaptiveFormats: [
            {
              url: 'mock'
            }
          ]
        }
      }.to_json
    )
  end

  subject { described_class.new(response_raw) }

  describe '#formats' do
    it 'returns a collection of YoutubeAudio::Format' do
      expect(subject.formats.length).to eq(1)
      expect(subject.formats.first).to be_instance_of(YoutubeAudio::Format)
      expect(subject.formats.first.url).to eq('mock')
    end
  end
end
