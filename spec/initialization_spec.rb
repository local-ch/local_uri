require 'spec_helper.rb'

describe LocalUri::URI do
  it 'initalizes' do
    URI('https://local.ch')
  end

  it 'initalizes also when given a URI ruby core object' do
    expect(URI(LocalUri::URI_CORE.parse('https://local.ch')).to_s).to eq('https://local.ch')
  end
end
