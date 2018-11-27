require 'rails_helper'

describe BackgroundImage do
  location = "denver,co"
  subject { BackgroundImage.new(location) }

  it 'exists' do
    expect(subject).to be_a(BackgroundImage)
  end

  context 'instance methods' do
    context '#city_image' do
      it 'returns a collection of image' do
        expect(subject.city_image).to have_key(:city_id)
        expect(subject.city_image).to have_key(:city_title)
        expect(subject.city_image).to have_key(:city_url)
        expect(subject.city_image).to have_key(:city_short_url)
      end
    end
  end
end
