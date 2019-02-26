module UserTestHelper 

  def log_in_admin_from_controller
    old_con = @controller
    @controller = Admins::SessionsController.new
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    post :create, params: {admin: {email: "test@example.com", password:"123456"}}
    @controller = old_con
  end

  def log_in_user_from_controller
    old_con = @controller
    @controller = Users::SessionsController.new
    @request.env["devise.mapping"] = Devise.mappings[:user]
    post :create, params: {user: {email: "test@example.com", password:"123456"}}
    @controller = old_con
  end

  def create_user
    User.create(email:"test@example.com", password: "123456", first_name: "John", last_name: "Doe")
  end

  def log_in_user
    visit new_user_session_path
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "123456"
    click_on "Log in"
  end

  def create_and_log_in_user
    create_user
    log_in_user
  end  
  
  def create_admin
    Admin.create(email: "test@example.com", password:"123456", first_name: "John", last_name: "Doe")
  end

  def log_in_admin
    visit new_admin_session_path
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "123456"
    click_on "Log in"
  end

  def create_and_log_in_admin
    create_admin
    log_in_admin
  end  
end