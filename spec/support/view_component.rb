# frozen_string_literal: true

RSpec.configure do |config|
  require 'view_component/test_helpers'
  require 'view_component/system_test_helpers'
  require 'capybara/rspec'
  config.include ViewComponent::TestHelpers, type: :component
  config.include ViewComponent::SystemTestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component
end
