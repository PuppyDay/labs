require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations
require 'test-unit'
require 'shoulda-context'


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
    Результат: 1.7321428571428572 = @driver.find_element(:id, "result").text
    Шаги:     2     1.75     1.7321428571428572 = @driver.find_element(:id, "steps").text
    @driver.find_element(:id, "v1").clear
    @driver.find_element(:id, "v1").send_keys "10"
    Результат: 3.16245562280389 = @driver.find_element(:id, "result").text
    Шаги:     5.5     3.659090909090909     3.196005081874647     3.16245562280389 = @driver.find_element(:id, "steps").text
  end
  
  def element_present?(how, what)
    ${receiver}.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    ${receiver}.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = ${receiver}.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
