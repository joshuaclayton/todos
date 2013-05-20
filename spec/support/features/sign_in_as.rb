module Features
  def sign_in_as(email)
    visit root_path
    fill_in 'Email address', with: email
    click_on 'Sign in'
  end
end
