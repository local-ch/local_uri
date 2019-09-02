require 'spec_helper.rb'

describe LocalUri::URI do
  it 'responds to empty?' do
    expect(URI('https://local.ch').empty?).to eq false
  end
end
