# frozen_string_literal: true

RSpec.describe YoutubeAudio::Search do
  let(:keyword) { 'la vida boheme - flamingo' }

  subject { described_class.new(keyword) }

  describe '#results' do
    it 'returns a collection of YoutubeAudio::SearchItem' do
      VCR.use_cassette('search/results') do
        expect(subject.results.length).to eq(23)
        expect(subject.results.first)
          .to be_instance_of(YoutubeAudio::SearchItem)

        # attributes [title, description, formats]
        expect(subject.results.first.title)
          .to eq('Flamingo - La Vida Boheme (Official Music Video)')
        expect(subject.results.first.description)
          .to match('available on all platforms:')
        expect(subject.results.first.formats.first)
          .to be_instance_of(YoutubeAudio::Format)

        expect(subject.results.first.formats.length).to eq(4)
      end
    end
  end
end
