module Features
  def sign_in
    sign_in_with 'person@example.com'
  end

  def sign_in_with(email)
    if !current_path
      visit root_path
    end

    fill_in 'Email', with: email
    click_on 'Sign in'
  end
end
