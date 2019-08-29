require 'spec_helper.rb'

describe LocalUri::URI do
  it 'initalizes' do
    expect(URI('https://local.ch').to_s).to eq 'https://local.ch'
  end
end
