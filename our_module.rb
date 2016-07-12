module OurModule
  def registration

    @driver.navigate.to 'http://demo.redmine.org/'
    @driver.find_element(:class, 'register').click

    @wait.until {@driver.find_element(:id, 'user_login').displayed?}

    @login = ('juma' + rand(9999).to_s)

    @driver.find_element(:id, 'user_login').send_keys @login
    @driver.find_element(:id, 'user_password').send_keys 'juma'
    @driver.find_element(:id, 'user_password_confirmation').send_keys 'juma'
    @driver.find_element(:id, 'user_firstname').send_keys 'ju'
    @driver.find_element(:id, 'user_lastname').send_keys 'ju'
    @driver.find_element(:id, 'user_mail').send_keys (@login + '@fd.dk')
    @driver.find_element(:name, 'commit').click
  end

  def login
    @driver.navigate.to 'http://demo.redmine.org/'
    @driver.find_element(:class, 'login').click

    @wait.until {@driver.find_element(:id, 'username').displayed?}

    @driver.find_element(:id, 'username').send_keys 'jumaziechka'
    @driver.find_element(:id, 'password').send_keys 'jumaziechka'
    @driver.find_element(:name, 'login').click
  end

  def change_password
    @driver.find_element(:class, 'my-account').click

    @wait.until {@driver.find_element(:class, 'icon-passwd').displayed?}

    @driver.find_element(:class, 'icon-passwd').click

    @wait.until {@driver.find_element(:id, 'password').displayed?}

    @driver.find_element(:id, 'password').send_keys 'juma'
    @driver.find_element(:id, 'new_password').send_keys 'jumazii'
    @driver.find_element(:id, 'new_password_confirmation').send_keys 'jumazii'
    @driver.find_element(:name, 'commit').click
  end

  def create_new_project
    @driver.find_element(:class, 'projects').click

    @wait.until {@driver.find_element(:class, 'icon-add').displayed?}

    @driver.find_element(:class, 'icon-add').click

    @wait.until {@driver.find_element(:id, 'project_name').displayed?}

    projectname = ('juproject' + rand(9999).to_s)

    @driver.find_element(:id, 'project_name').send_keys projectname
    @driver.find_element(:id, 'project_description').send_keys 'juprojectdescription'
    @driver.find_element(:name, 'commit').click

  end

  def add_new_user
    @driver.find_element(:class, 'selected').click

    @wait.until {@driver.find_element(:id, 'tab-members').displayed?}

    @driver.find_element(:id, 'tab-members').click

    @driver.find_element(:class, 'icon-add').click

    @wait.until {@driver.find_element(:id, 'principal_search').displayed?}

    @driver.find_element(:id, 'principal_search').send_keys @login

    @wait.until {@driver.find_element(:css, '#principals input').displayed?}

    @driver.find_element(:css, '#principals input').click

    @driver.find_element(:css, "div#ajax-modal input[value='3']").click
    @driver.find_element(:id, 'member-add-submit').click
  end

  def user_roles
    @driver.find_element(:xpath, "//td[@class='buttons']//a[@class='icon icon-edit']").click

    @wait.until {@driver.find_element(:xpath, "//td[@class='roles']//input[@value='4']").displayed?}

    @driver.find_element(:xpath, "//td[@class='roles']//input[@value='4']").click
    @driver.find_element(:xpath, "//td[@class='roles']//input[@value='Save']").click
  end

  def new_version
    @driver.find_element(:id, 'tab-versions').click

    @wait.until {@driver.find_element(:xpath, "//div[@id='tab-content-versions']//a[contains(text(),'New version')]").displayed?}

    @driver.find_element(:xpath, "//div[@id='tab-content-versions']//a[contains(text(),'New version')]").click

    @wait.until {@driver.find_element(:id, 'version_name').displayed?}

    @version_name = ('version' + rand(9999).to_s)
    @driver.find_element(:id, 'version_name').send_keys @version_name
    @driver.find_element(:name, 'commit').click
  end

  def issue_creation_bug
    @driver.find_element(:xpath, "//a[contains(text(),'New issue')]").click

    @wait.until {@driver.find_element(:id, 'issue_subject').displayed?}

    @driver.find_element(:id, 'issue_subject').send_keys 'Critical Bug'
    @driver.find_element(:xpath, "//form[@id='issue-form']//input[@value='Create and continue']").click
  end

  def issue_creation_feature
    @driver.find_element(:xpath, "//a[contains(text(),'New issue')]").click

    @wait.until {@driver.find_element(:id, 'issue_subject').displayed?}

    @driver.find_element(:id, 'issue_subject').send_keys 'Feature'

    @driver.find_element(:name, "issue[tracker_id]").find_element(:xpath, "//select[@name='issue[tracker_id]']//option[@value='2']").click

    @driver.find_element(:xpath, "//form[@id='issue-form']//input[@value='Create']").click
  end

  def issue_creation_support
    @driver.find_element(:xpath, "//a[contains(text(),'New issue')]").click

    @wait.until {@driver.find_element(:id, 'issue_subject').displayed?}

    @driver.find_element(:id, 'issue_subject').send_keys 'Support'
    @driver.find_element(:name, "issue[tracker_id]").find_element(:xpath, "//select[@name='issue[tracker_id]']//option[@value='3']").click
    @driver.find_element(:xpath, "//form[@id='issue-form']//input[@value='Create']").click
  end

end
