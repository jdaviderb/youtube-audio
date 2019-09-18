# frozen_string_literal: true

RSpec.describe YoutubeAudio::Format do
  let(:response_raw) do
    JSON.parse(
      { # url=mock&s=mock-signature&sp=sig
        mimeType: 'audio/mp4',
        approxDurationMs: '1000',
        audioQuality: 'low',
        url: 'url-mock'
      }.to_json
    )
  end

  subject { described_class.new(response_raw, script_player_url: 'mock') }

  describe '#mime_type' do
    it { expect(subject.mime_type).to eq('audio/mp4') }
  end

  describe '#approx_duration_ms' do
    it { expect(subject.approx_duration_ms).to eq('1000') }
  end

  describe '#audio_quality' do
    it { expect(subject.audio_quality).to eq('low') }
  end

  describe '#url' do
    it { expect(subject.url).to eq('url-mock') }

    it 'returns an url with signature' do
      mock = instance_double(YoutubeAudio::UrlDecipher, decipher: 'decipher')
      expect(subject).to receive(:cipher)
        .twice
        .and_return('url=mock&s=mock-signature&sp=sig')

      expect(YoutubeAudio::UrlDecipher).to receive(:new)
        .with('url=mock&s=mock-signature&sp=sig',
              script_player_url: 'mock')
        .and_return(mock)

      expect(subject.url).to eq('decipher')
    end
  end

  describe '#audio?' do
    it 'returns true if the mime type is an audio' do
      expect(subject.audio?).to eq(true)
    end

    it 'returns false if the mime type is not an audio' do
      expect(subject).to receive(:mime_type).and_return('video/mp4')
      expect(subject.audio?).to eq(false)
    end
  end
end
