# frozen_string_literal: true

RSpec.describe YoutubeAudio do
  it 'has a version number' do
    expect(YoutubeAudio::VERSION).not_to be nil
  end

  it 'does something useful' do
    YoutubeAudio::Download.new('asasa')
    expect(true).to eq(true)
  end
end
