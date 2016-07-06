require 'test-unit'
require 'selenium-webdriver'
require_relative 'our_module'

class FirstHomeWork < Test::Unit::TestCase
  include OurModule

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_registration
    registration
    sleep 3
    expected_text = 'Your account has been activated. You can now log in.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_logout
    registration
    sleep 3
    @driver.find_element(:class, 'logout').click
    sleep 3
    login_button = @driver.find_element(:class, 'login')
    assert(login_button.displayed?)
  end

  def test_login
    login
    sleep 3
    logout_button = @driver.find_element(:class, 'logout')
    assert(logout_button.displayed?)
  end

  def test_changepassword
    registration
    sleep 3
    changepassword
    sleep 3
    expected_text = 'Password was successfully updated.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_createnewproject
    login
    sleep 3
    createnewproject
    sleep 3
    expected_text = 'Successful creation.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_addnewuser
    login
    sleep 3
    createnewproject
    sleep 3
    @driver.find_element(:id, 'tab-members').click
    users_before = @driver.find_elements(:xpath, "//a[@class='user active']").length
    addnewuser
    sleep 3
    users_after = @driver.find_elements(:xpath, "//a[@class='user active']").length
    assert(users_after > users_before)
  end

  def test_userroles
    login
    sleep 3
    createnewproject
    sleep 3
    addnewuser
    sleep 3
    userroles
    sleep 5
    role_after = @driver.find_element(:xpath, "//div[@id='tab-content-members']//span[contains(text(),'Manager')]").text
    assert_equal('Manager, Developer', role_after)
  end

  def test_newversion
    login
    sleep 3
    createnewproject
    sleep 3
    newversion
    sleep 3
    actual_version = @driver.find_element(:xpath, "//div[@id='tab-content-versions']//td[@class='name']").text
    assert_equal(@version_name, actual_version)
  end

  def test_issue_creation_bug
    login
    sleep 3
    createnewproject
    sleep 3
    issue_creation_bug
    sleep 5
    actual_result = @driver.find_element(:xpath, "//div[@id='main']//div[@id='content']//a[contains(@href,'/issues/')]")
    assert(actual_result.displayed?)
  end

  def test_issue_creation_feature
    login
    sleep 3
    createnewproject
    sleep 3
    issue_creation_feature
    sleep 5
    actual_result = @driver.find_element(:xpath, "//div[@id='main']//div[@id='content']//a[contains(@href,'/issues/')]")
    assert(actual_result.displayed?)
  end

  def test_issue_creation_support
    login
    sleep 3
    createnewproject
    sleep 3
    issue_creation_bug
    sleep 5
    actual_result = @driver.find_element(:xpath, "//div[@id='main']//div[@id='content']//a[contains(@href,'/issues/')]")
    assert(actual_result.displayed?)
  end

  def test_issue_creation_bug_check
    login
    sleep 3
    createnewproject
    sleep 3
    issue_creation_feature
    sleep 3
    @driver.find_element(:xpath, "//a[contains(text(),'Issues')]").click
    sleep 5
      actual_result = @driver.find_element(:xpath, "//td[@class='subject']//a[contains(text(),'Critical Bug')]")
    assert(actual_result.displayed?)
  end

  def test_issue_feature_check
    login
    sleep 3
    createnewproject
    sleep 3
    issue_creation_support
    sleep 3
    @driver.find_element(:xpath, "//a[contains(text(),'Issues')]").click
    sleep 5
    actual_result = @driver.find_element(:xpath, "//td[@class='subject']//a[contains(text(),'Feature')]")
    assert(actual_result.displayed?)
  end


  def test_issue_support_check
    login
    sleep 3
    createnewproject
    sleep 3
    issue_creation_support
    sleep 3
    @driver.find_element(:xpath, "//a[contains(text(),'Issues')]").click
    sleep 5
    actual_result = @driver.find_element(:xpath, "//td[@class='subject']//a[contains(text(),'Support')]")
    assert(actual_result.displayed?)
  end

  def teardown
    @driver.quit
  end

end


