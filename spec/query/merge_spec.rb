require 'spec_helper.rb'

describe LocalUri::URI do
  subject { URI('https://local.ch') }

  context 'merge' do
    it 'adds get parameters' do
      expect(subject.query.merge(id: 1).to_s).to eq 'https://local.ch?id=1'
    end

    context 'exi  sting query params' do
      subject { URI('https://local.ch?id=1') }

      it 'changes existing parameters' do
        expect(subject.query.merge(id: 2).to_s).to eq 'https://local.ch?id=2'
      end
    end

    context 'empty query params' do
      it 'does not change the original url' do
        expect(subject.query.merge({}).to_s).to eq 'https://local.ch'
      end
    end
  end

  context 'merge!' do
    it 'changes the original object' do
      subject.query.merge!(id: 1)
      expect(subject.to_s).to eq 'https://local.ch?id=1'
    end

    context 'existing query params' do
      subject { URI('https://local.ch?id=1') }

      it 'changes existing parameters' do
        subject.query.merge!(id: 2)
        expect(subject.to_s).to eq 'https://local.ch?id=2'
      end
    end

    context 'empty query params' do
      it 'does not change the original url' do
        expect(subject.query.merge({}).to_s).to eq 'https://local.ch'
      end
    end
  end

  context 'access query data' do
    subject { URI('https://local.ch?id=1&place[name]=casa') }

    it 'allows to access query data with hash-bracket-notiation' do
      expect(subject.query[:id]).to eq '1'
    end

    it 'allows to access query data with dig' do
      expect(subject.query.dig(:place, :name)).to eq 'casa'
    end
  end
end
