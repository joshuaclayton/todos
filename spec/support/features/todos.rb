module Features
  def display_todo_named(name)
    have_css '.todos li', text: name
  end
end
