module Features
  def display_todo_named(name)
    have_css '.todos li', text: name
  end

  def create_todo_named(name)
    sign_in
    click_on 'Add new todo'
    fill_in 'Name', with: name
    click_on 'Submit'
  end
end
