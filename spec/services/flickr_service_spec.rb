require 'rails_helper'

describe FlickrService do
  location = "denver, co"
  subject { FlickrService.new(location) }

  it 'exists' do
    expect(subject).to be_a FlickrService
  end

  context 'instance methods' do
    context '#all_photos' do
      it 'returns an array of Flickr image object' do

        expect(subject.all_photos).to be_an Array
      end
    end
  end
end
