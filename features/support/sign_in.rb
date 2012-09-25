module SignIn
  include Capybara::DSL

  def sign_in_as(email)
    visit root_path
    fill_in 'Email', with: email
    click_button 'Sign In'
  end
end

World SignIn
