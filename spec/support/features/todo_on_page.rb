class TodoOnPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def initialize(title)
    @title = title
  end

  def create
    visit todos_path
    fill_in 'Title', with: @title
    click_on 'Create Todo'
  end

  def mark_complete
    todo.click_on 'Mark complete'
  end

  def mark_incomplete
    todo.click_on 'Mark incomplete'
  end

  def complete?
    todo.has_link? 'Mark incomplete'
  end

  def visible?
    within todo_list do
      any_todos? && todo.visible?
    end
  end

  private

  def any_todos?
    all('li', text: @title).any?
  end

  def todo
    find('li', text: @title)
  end

  def todo_list
    find 'ul.todos'
  end
end
