# explanation: https://avikdas.com/2019/04/15/a-graphical-introduction-to-dynamic-programming.html

require 'rspec/autorun'

def house_robber(houses)
  a = 0 # f(i - 2)
  b = 0 # f(i - 1)

  houses.each do |house|
    # we do this so we don't need to create an additional variable for storage
    a, b = b, [b, a + house].max
  end

  b
end

RSpec.describe '#house_robber' do
  example 'max house difference of 2 spaces' do
    houses = [3, 10, 3, 1, 2]

    expect(house_robber(houses)).to eq(12)
  end
end
