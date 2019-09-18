# frozen_string_literal: true

RSpec.describe YoutubeAudio::UrlDecipher do
  let(:cipher) { 'url=mock&s=mock-signature&sp=sig' }

  subject do
    described_class.new(cipher, script_player_url: 'script_player_url_mock')
  end

  describe '#decipher' do
    before do
      expect(YoutubeAudio::Decipher).to receive(:new)
        .with('script_player_url_mock')
        .and_return(double(decipher: 'sig-mock'))
    end

    it 'deciphers a cipher url' do
      expect(subject.decipher).to eq('mock&sig=sig-mock')
    end
  end
end
