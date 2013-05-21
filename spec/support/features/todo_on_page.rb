class TodoOnPage
  include Capybara::DSL

  def initialize(todo_title)
    @todo_title = todo_title
  end

  def create
    click_on 'Create new todo'
    fill_in 'Title', with: @todo_title
    click_on 'Create'
  end

  def has_incomplete_link?
    todo_on_page.has_css? 'a', text: 'Incomplete'
  end

  def has_complete_link?
    todo_on_page.has_css? 'a', text: 'Complete'
  end

  def complete?
    todo_on_page['data-state'] == 'complete'
  end

  def incomplete?
    todo_on_page['data-state'] == 'incomplete'
  end

  def mark_complete
    todo_on_page.click_on 'Complete'
  end

  def mark_incomplete
    todo_on_page.click_on 'Incomplete'
  end

  def present?
    todo_on_page.present?
  end

  private

  def todo_on_page
    find("[data-id='#{todo.id}']")
  end

  def todo
    Todo.where(title: @todo_title).first
  end
end
