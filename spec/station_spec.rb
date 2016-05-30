require 'station'

describe Station do

  subject(:station) {described_class.new("Bank", 1)}

  it {is_expected.to respond_to(:zone)}

  it 'returns name' do
    expect(subject.name).to eq("Bank")
  end

  it 'return zone' do
    expect(subject.zone).to eq(1)
  end

end