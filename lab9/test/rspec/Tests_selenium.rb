require 'json'
require 'selenium-webdriver'
require 'rspec'
include RSpec::Expectations

describe 'Correct' do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = 'http://localhost:3000/'
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    expect(@verification_errors).to eq([])
  end

  it 'test_correct' do
    @driver.get @base_url
    @driver.find_element(:id, 'v1').click
    @driver.find_element(:id, 'v1').clear
    @driver.find_element(:id, 'v1').send_keys '5'
    @driver.find_element(:name, 'commit').click
    sleep 1
    expect(@driver.find_element(:id, 'result').text).to eq('Результат: 2.2360688956433634')
  end

  it 'test_empty' do
    @driver.get 'http://localhost:3000/'
    @driver.find_element(:id, 'v1').click
    @driver.find_element(:id, 'v1').clear
    @driver.find_element(:id, 'v1').send_keys ''
    @driver.find_element(:name, 'commit').click
    sleep 1
    expect(@driver.find_element(:id, 'result').text).to eq('Введите корректные данные')
  end

  it 'test_incorrect' do
    @driver.get 'http://localhost:3000/'
    @driver.find_element(:id, 'v1').click
    @driver.find_element(:id, 'v1').clear
    @driver.find_element(:id, 'v1').send_keys 'aaaaa'
    @driver.find_element(:name, 'commit').click
    sleep 1
    expect(@driver.find_element(:id, 'result').text).to eq('Введите корректные данные')
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
end
