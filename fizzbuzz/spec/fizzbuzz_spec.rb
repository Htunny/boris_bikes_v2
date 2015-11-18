require 'fizzbuzz'

describe 'fizzbuzz' do
  it 'returns fizz when passed 3' do
    expect(fizzbuzz(3)).to eq('fizz')
  end

  it 'returns fizz at multiples of 3' do
    expect(fizzbuzz(9)).to eq('fizz')
  end
end
