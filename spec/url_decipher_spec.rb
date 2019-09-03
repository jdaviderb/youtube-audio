# frozen_string_literal: true

RSpec.describe YoutubeAudio::UrlDecipher do
  let(:cipher) { 'url=mock&s=mock-signature&sp=sig' }

  subject { described_class.new(cipher) }

  describe '#decipher' do
    it 'deciphers a cipher url' do
      expect(YoutubeAudio::Decipher).to receive(:new).and_call_original
      expect(subject.decipher).to eq('mock&sig=gk-simcat')
    end
  end
end
