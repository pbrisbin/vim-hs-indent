require 'rspec'
require 'vimrunner'
require 'vimrunner/rspec'

Dir["spec/support/**/*.rb"].each { |f| require File.expand_path(f) }

ROOT = File.expand_path('../..', __FILE__)

Vimrunner::RSpec.configure do |config|
  config.reuse_server = true
  config.start_vim do
    vim = Vimrunner.start
    vim.append_runtimepath(ROOT)
    vim.set(:shiftwidth, 4)

    vim
  end
end

RSpec.configure do |config|
  config.order = :random
end
