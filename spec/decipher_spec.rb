# frozen_string_literal: true

RSpec.describe YoutubeAudio::Decipher do
  subject { described_class.new }

  describe '#decipher' do
    let(:signature) do
      'qLALgxI2AwRAIgbG7LwidtAcuTBa1Rw8hp5sUXLESfIyXM2MHr4m6jDtUCIARjHJ-5Y' \
        'KOvBfrSPrfc9N62UwxcUvy4kVFNQRL_2glvvlg'
    end
    let(:decipher) do
      'ALgxI2wwRAIgbG7LwidtAcuTBa1Rs8hp5qUXLESfIyXM2MHr4m6jDtUCIARjHJ-5' \
        'YKOvBfrSPrfc9N62UwxcUvy4kVFNQRL_2glv'
    end

    it 'returns decipher signature' do
      expect(subject.decipher(signature)).to eq(decipher)
    end
  end
end
