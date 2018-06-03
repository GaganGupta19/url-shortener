require 'rails_helper'

describe 'Url shortener service' do
  it "clean the url" do
    url = 'https://www.google.com/ping'
    expect(UrlShortener.sanitize_url(url)).to eq 'http://google.com/ping'
  end

  it 'return unique key' do
    expect(UrlShortener.get_uniq_key).not_to eq UrlShortener.get_uniq_key
  end
end

describe ShortenedUrl, :type => :model do
  context 'with invalid attributes' do
    subject {
      described_class.new(url: nil)
    }

    it "is not valid without a url" do
      expect(subject).not_to be_valid
    end

    it "is not valid without a unique key" do
      expect(subject).not_to be_valid
    end
  end

  context 'with valid attributes' do
    subject {
      described_class.new(url: nil)
    }

    it "is valid with a url and a unique key" do
      subject.url = 'http://google.com/ping'
      subject.generate_token
      expect(subject).to be_valid
    end
  end
end