module TodoCreator
  def create_todo_named(name)
    click_link 'Create a new todo'
    fill_in 'Name', with: name
    click_button 'Create todo'
  end
end

World TodoCreator
