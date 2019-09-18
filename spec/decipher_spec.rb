# frozen_string_literal: true

RSpec.describe YoutubeAudio::Decipher do
  let(:player_base_url) do
    '/yts/jsbin/player-plasma-ias-phone-en_US-vflZqC1Iu/base.js'
  end

  subject { described_class.new(player_base_url) }

  describe '#decipher' do
    let(:signature) do
      'qLALgxI2AwRAIgbG7LwidtAcuTBa1Rw8hp5sUXLESfIyXM2MHr4m6jDtUCIARjHJ-5Y' \
        'KOvBfrSPrfc9N62UwxcUvy4kVFNQRL_2glvvlg'
    end
    let(:decipher) do
      'vgg2_LRQNFVk4yvUcxwU26N9cfrPSrfBvOKY5-JHjRAICUtDj6m4rHM2MXyIfSELX' \
        'Uslph8wR1aBTucAtdiwL7GbgIARwA2Ixq'
    end

    it 'returns decipher signature' do
      VCR.use_cassette('youtube/player_base.js') do
        expect(subject.decipher(signature)).to eq(decipher)
      end
    end
  end
end
