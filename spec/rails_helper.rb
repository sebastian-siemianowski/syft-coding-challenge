require 'active_support/dependencies'

Dir[File.expand_path("../../app/**/*", __FILE__)].each do |path|
  next unless File.directory?(path)
  ActiveSupport::Dependencies.autoload_paths << path
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.after(:each, type: :feature) do
    I18n.locale = I18n.default_locale
  end

  config.disable_monkey_patching!
  config.order = :random
  Kernel.srand config.seed
end
