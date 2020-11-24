require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations


describe "TestLab9" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://www.google.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end

  it "test_lab9" do
    @driver.get "http://localhost:3000/"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:id, "v1").clear
    @driver.find_element(:id, "v1").send_keys "10"
  end
end
