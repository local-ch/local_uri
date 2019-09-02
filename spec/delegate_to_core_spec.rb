require 'spec_helper.rb'

describe LocalUri::URI do
  subject {URI('https://local.ch')}

  it 'delegates to_s to URI core' do
    expect(subject.to_s).to eq 'https://local.ch'
  end

  it 'delegates scheme to URI core' do
    expect(subject.scheme).to eq 'https'
  end

  it 'delegates scheme= to URI core' do
    subject.scheme = 'http'
    expect(subject.to_s).to eq 'http://local.ch'
  end

  it 'delegates host to URI core' do
    expect(subject.host).to eq 'local.ch'
  end

  it 'delegates host= to URI core' do
    subject.host = 'google.com'
    expect(subject.to_s).to eq 'https://google.com'
  end

  it 'delegates hostname to URI core' do
    expect(subject.hostname).to eq 'local.ch'
  end

  it 'delegates hostname= to URI core' do
    subject.hostname = 'google.com'
    expect(subject.to_s).to eq 'https://google.com'
  end

  it 'delegates path to URI core' do
    expect(subject.path).to eq ''
  end

  it 'delegates path= to URI core' do
    subject.path = '/endpoint'
    expect(subject.to_s).to eq 'https://local.ch/endpoint'
  end

  it 'delegates path to URI core' do
    expect(subject.port).to eq 443
  end

  it 'delegates port= to URI core' do
    subject.port = 3000
    expect(subject.to_s).to eq 'https://local.ch:3000'
  end

  it 'delegates request_uri to URI core' do
    expect(URI('http://local.ch/abc?test=123').request_uri).to eq '/abc?test=123'
  end
end
