require 'capybara/rspec'

Capybara.server_host = Socket.ip_address_list.detect{|addr| addr.ipv4_private?}.ip_address
Capybara.server_port = 3001

Capybara.register_driver :selenium_remote do |app|
  url = "http://selenium_chrome:4444/wd/hub"
  opts = { desired_capabilities: :chrome, browser: :remote, url: url }
  driver = Capybara::Selenium::Driver.new(app, opts)
end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium, using: :chrome, options: {
        browser: :remote,
        url: "http://selenium_chrome:4444/wd/hub",
        desired_capabilities: :chrome
      }
    host! "http://#{Capybara.server_host}:#{Capybara.server_port}"
  end
end