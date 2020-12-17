require 'spec_helper.rb'

describe LocalUri::URI do
  subject { URI('https://local.ch') }

  context 'except' do
    subject { URI('https://local.ch?one=1&two=2&three=3') }

    it 'Returns a uri which query includes everything except given keys' do
      uri = subject.query.except(:two, :three)
      expect(uri).to be_kind_of(LocalUri::URI)
      expect(uri.to_s).to eq 'https://local.ch?one=1'
      expect(subject.to_s).to eq 'https://local.ch?one=1&two=2&three=3'
    end

    it 'Removes the given keys from the query of the original uri and returns the uri itself' do
      _return = subject.query.except!(:two, :three)
      expect(_return).to be_kind_of(LocalUri::URI)
      expect(subject.to_s).to eq 'https://local.ch?one=1'
    end
  end
end
