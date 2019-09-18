# frozen_string_literal: true

RSpec.describe YoutubeAudio::Download do
  let(:url) do
    'https://www.youtube.com/watch?v=xoWRkd3oGcs&list=RDxoWRkd3oGcs'
  end

  subject { described_class.new(url) }

  describe '#formats' do
    it 'returns a collection of YoutubeAudio::Format' do
      VCR.use_cassette('youtube/xoWRkd3oGcs') do
        expect(subject.formats.length).to eq(4)
        expect(subject.formats.first).to be_instance_of(YoutubeAudio::Format)
        expect(subject.formats.first.url).to match('mp4')
        expect(subject.formats.first.audio_quality).to match('AUDIO_Q')
      end
    end
  end
end
