class TodoOnPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def initialize(title)
    @title = title
  end

  def self.create(title)
    new(title).tap do |todo|
      todo.create
    end
  end

  def create
    visit todos_path
    click_on 'Add a Todo'
    fill_in 'Title', with: @title
    click_on 'Submit'
  end

  def complete
    within todo_element do
      click_on 'Mark complete'
    end
  end

  def completed?
    todo_element.native['class'].include? 'complete'
  end

  def present?
    begin
      !!todo_element
    rescue Capybara::ElementNotFound
      false
    end
  end

  private

  def todo_element
    find 'li', text: @title
  end
end
