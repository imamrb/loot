Dir['./lib/*.rb'].sort.each { |file| require file }
require 'pry'

RSpec.configure do |config|
  config.order = :random
  Kernel.srand config.seed
end
