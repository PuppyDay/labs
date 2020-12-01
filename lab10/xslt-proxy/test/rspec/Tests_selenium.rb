# frozen_string_literal: true

require 'json'
require 'selenium-webdriver'
require 'rspec'
include RSpec::Expectations
HOST = 'http://localhost:3000/'
describe 'Correct' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    expect(@verification_errors).to eq([])
  end

  it 'browser_correct' do
    @driver.get HOST
    @driver.find_element(:id, 'v1').click
    @driver.find_element(:id, 'v1').clear
    @driver.find_element(:id, 'v1').send_keys '345'
    @driver.find_element(:id, 'client-side-xslt').click
    @driver.find_element(:name, 'commit').click
    expect(@driver.find_element(:xpath, '//label').text).to eq('Я генерируюсь на стороне браузера!')
    expect(@driver.find_element(:xpath, '//tr[9]/td').text).to eq('18.57421350446529')
    expect(@driver.find_element(:xpath, '//td').text).to eq('173.0')
    expect(@driver.find_element(:xpath, '//tr[2]/td').text).to eq('87.4971098265896')
    expect(@driver.find_element(:xpath, '//tr[3]/td').text).to eq('45.720048604250735')
    expect(@driver.find_element(:xpath, '//tr[4]/td').text).to eq('26.632986170410916')
    expect(@driver.find_element(:xpath, '//tr[5]/td').text).to eq('19.79342356893944')
    expect(@driver.find_element(:xpath, '//tr[6]/td').text).to eq('18.611727627948827')
    expect(@driver.find_element(:xpath, '//tr[7]/td').text).to eq('18.57421350446529')
  end

  it 'xml_correct' do
    @driver.get HOST
    @driver.find_element(:id, 'v1').click
    @driver.find_element(:id, 'v1').clear
    @driver.find_element(:id, 'v1').send_keys '54'
    @driver.find_element(:xpath, '//div[2]/label').click
    @driver.find_element(:name, 'commit').click
    expect(@driver.find_element(:xpath, 'floats/float[1]').text).to eq('27.5')
    expect(@driver.find_element(:xpath, 'floats/float[2]').text).to eq('14.731818181818182')
    expect(@driver.find_element(:xpath, 'floats/float[3]').text).to eq('9.198676755210233')
    expect(@driver.find_element(:xpath, 'floats/float[4]').text).to eq('7.534543159608887')
    expect(@driver.find_element(:xpath, 'floats/float[last()]').text).to eq('7.350766879790429')
  end

  it 'xml_incorrect' do
    @driver.get HOST
    @driver.find_element(:id, 'v1').click
    @driver.find_element(:id, 'v1').clear
    @driver.find_element(:id, 'v1').send_keys 'yyy'
    @driver.find_element(:xpath, '//div[2]/label').click
    @driver.find_element(:name, 'commit').click
    expect(@driver.find_element(:xpath, 'floats/float[last()]').text).to eq('-1.0')
  end

  it 'server_correct' do
    @driver.get HOST
    @driver.find_element(:id, 'v1').click
    @driver.find_element(:id, 'v1').clear
    @driver.find_element(:id, 'v1').send_keys '10'
    @driver.find_element(:xpath, '//div/label').click
    @driver.find_element(:name, 'commit').click
    expect(@driver.find_element(:xpath, '//label').text).to eq('Я генерируюсь на стороне сервера!')
    expect(@driver.find_element(:xpath, '//td').text).to eq('5.5')
    expect(@driver.find_element(:xpath, '//tr[2]/td').text).to eq('3.659090909090909')
    expect(@driver.find_element(:xpath, '//tr[3]/td').text).to eq('3.196005081874647')
    expect(@driver.find_element(:xpath, '//tr[4]/td').text).to eq('3.16245562280389')
  end

  it 'server_incorrect' do
    @driver.get HOST
    @driver.find_element(:id, 'v1').click
    @driver.find_element(:id, 'v1').clear
    @driver.find_element(:id, 'v1').send_keys 'eeeee'
    @driver.find_element(:xpath, '//div/label').click
    @driver.find_element(:name, 'commit').click
    expect(@driver.find_element(:xpath, '//label').text).to eq('Я генерируюсь на стороне сервера!')
    expect(@driver.find_element(:xpath, '//label[2]').text).to eq('Введите, пожалуйста, корректные данные.')
  end

  it 'browser_incorrect' do
    @driver.get HOST
    @driver.find_element(:id, 'v1').click
    @driver.find_element(:id, 'v1').clear
    @driver.find_element(:id, 'v1').send_keys 'uuuuu'
    @driver.find_element(:xpath, '//div[3]/label').click
    @driver.find_element(:name, 'commit').click
    expect(@driver.find_element(:xpath, '//label').text).to eq('Я генерируюсь на стороне браузера!')
    expect(@driver.find_element(:xpath, '//label[2]').text).to eq('Введите, пожалуйста, корректные данные.')
  end

  def verify
    yield
  rescue ExpectationNotMetError => e
    @verification_errors << e
  end
end
