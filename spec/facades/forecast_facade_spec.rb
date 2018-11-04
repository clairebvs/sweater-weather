require 'rails_helper'

describe ForecastFacade do
  location = "denver,co"
  subject { ForecastFacade.new(location) }

  it 'exists' do
    expect(subject).to be_a(ForecastFacade)
  end

  context 'instance methods' do
    context '#latitude' do
      it 'returns the latitude for a location' do
        expect(subject.latitude).to eq(39.7392358)
      end
    end
    
    context '#longitude' do
      it 'returns the longitude for a location' do
        expect(subject.longitude).to eq(-104.990251)
      end
    end
  end
end
