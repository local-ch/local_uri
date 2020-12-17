require 'spec_helper.rb'

describe LocalUri::URI do
  subject { URI('https://local.ch') }

  it 'returns query' do
    expect(subject.query).to be_kind_of LocalUri::Query
  end
end
