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

    @wait.until {@driver.find_element(:id, 'flash_notice').displayed?}

    expected_text = 'Your account has been activated. You can now log in.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_logout
    registration

    @wait.until {@driver.find_element(:class, 'logout').displayed?}

    @driver.find_element(:class, 'logout').click

    @wait.until {@driver.find_element(:class, 'login').displayed?}

    login_button = @driver.find_element(:class, 'login')
    assert(login_button.displayed?)
  end

  def test_login
    login

    @wait.until {@driver.find_element(:class, 'logout').displayed?}

    logout_button = @driver.find_element(:class, 'logout')
    assert(logout_button.displayed?)
  end

  def test_change_password
    registration

    @wait.until {@driver.find_element(:class, 'my-account').displayed?}

    change_password

    @wait.until {@driver.find_element(:id, 'flash_notice').displayed?}

    expected_text = 'Password was successfully updated.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_create_new_project
    login

    @wait.until {@driver.find_element(:class, 'projects').displayed?}

    create_new_project

    @wait.until {@driver.find_element(:id, 'flash_notice').displayed?}

    expected_text = 'Successful creation.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_add_new_user
    login

    @wait.until {@driver.find_element(:class, 'projects').displayed?}

    create_new_project

    @wait.until {@driver.find_element(:id, 'tab-members').displayed?}

    @driver.find_element(:id, 'tab-members').click

    @wait.until {@driver.find_element(:css, "a[class='user active']").displayed?}

    users_before = @driver.find_elements(:css, "a[class='user active']").length

    add_new_user

    sleep 5

    users_after = @driver.find_elements(:css, "a[class='user active']").length
    assert(users_after > users_before)
  end

  def test_user_roles
    login

    @wait.until {@driver.find_element(:class, 'projects').displayed?}

    create_new_project

    @wait.until {@driver.find_element(:class, 'selected').displayed?}

    add_new_user

    @wait.until {@driver.find_element(:css, "#tab-content-members a[class='icon icon-edit']").displayed?}

    user_roles

    @wait.until {@driver.find_element(:css, "#tab-content-members td[class='roles'] span").displayed?}

    role_after = @driver.find_element(:css, "#tab-content-members td[class='roles'] span").text
    assert_equal('Manager, Developer', role_after)
  end

  def test_new_version
    login

    @wait.until {@driver.find_element(:class, 'projects').displayed?}

    create_new_project

    @wait.until {@driver.find_element(:id, 'tab-versions').displayed?}

    new_version

    @wait.until {@driver.find_element(:css, "#tab-content-versions td[class='name']").displayed?}

    actual_version = @driver.find_element(:css, "#tab-content-versions td[class='name']").text
    assert_equal(@version_name, actual_version)
  end

  def test_issue_creation_bug
    login

    @wait.until {@driver.find_element(:class, 'projects').displayed?}

    create_new_project

    @wait.until {@driver.find_element(:class, 'new-issue').displayed?}

    issue_creation_bug

    @wait.until {@driver.find_element(:id, 'flash_notice').displayed?}

    actual_result = @driver.find_element(:id, 'flash_notice').text
    string = 'created'
    assert(actual_result.include?(string))
  end

  def test_issue_creation_feature
    login

    @wait.until {@driver.find_element(:class, 'projects').displayed?}

    create_new_project

    @wait.until {@driver.find_element(:class, 'new-issue').displayed?}

    issue_creation_feature

    @wait.until {@driver.find_element(:id, 'flash_notice').displayed?}

    actual_result = @driver.find_element(:id, 'flash_notice')
    assert(actual_result.displayed?)
  end

  def test_issue_creation_support
    login

    @wait.until {@driver.find_element(:class, 'projects').displayed?}

    create_new_project

    @wait.until {@driver.find_element(:class, 'new-issue').displayed?}

    issue_creation_support

    @wait.until {@driver.find_element(:id, 'flash_notice').displayed?}

    actual_result = @driver.find_element(:id, 'flash_notice')
    assert(actual_result.displayed?)
  end

  def test_issue_creation_bug_check
    login

    @wait.until {@driver.find_element(:class, 'projects').displayed?}

    create_new_project

    @wait.until {@driver.find_element(:class, 'new-issue').displayed?}

    issue_creation_bug

    @wait.until {@driver.find_element(:class, 'issues').displayed?}

    @driver.find_element(:class, 'issues').click

    @wait.until {@driver.find_element(:class, 'subject').displayed?}

    subjects = @driver.find_elements(:class, 'subject').map(&:text)
    string = 'Critical Bug'
    assert(subjects.include?(string))
  end

  def test_issue_feature_check
    login

    @wait.until {@driver.find_element(:class, 'projects').displayed?}

    create_new_project

    @wait.until {@driver.find_element(:class, 'new-issue').displayed?}

    issue_creation_feature

    @wait.until {@driver.find_element(:class, 'issues').displayed?}

    @driver.find_element(:class, 'issues').click

    @wait.until {@driver.find_element(:class, 'subject').displayed?}

    subjects = @driver.find_elements(:class, 'subject').map(&:text)
    string = 'Feature'
    assert(subjects.include?(string))
  end


  def test_issue_support_check
    login

    @wait.until {@driver.find_element(:class, 'projects').displayed?}

    create_new_project

    @wait.until {@driver.find_element(:class, 'new-issue').displayed?}

    issue_creation_support

    @wait.until {@driver.find_element(:class, 'issues').displayed?}

    @driver.find_element(:class, 'issues').click

    @wait.until {@driver.find_element(:class, 'subject').displayed?}

    subjects = @driver.find_elements(:class, 'subject').map(&:text)

    string = 'Support'
    assert(subjects.include?(string))
  end

  def teardown
    @driver.quit
  end


end


