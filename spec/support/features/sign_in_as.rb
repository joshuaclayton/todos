module Features
  def sign_in_as(email_address)
    visit '/'
    click_on 'Sign in'
    fill_in 'Email address', with: email_address
    click_on 'Sign in'
  end
end
