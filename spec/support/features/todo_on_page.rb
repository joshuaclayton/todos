class TodoOnPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def initialize(title)
    @title = title
  end

  def create
    visit todos_path
    click_on 'Add a Todo'
    fill_in 'Title', with: @title
    click_on 'Submit'
  end

  def complete
    within "li:contains('#{@title}')" do
      click_on 'Mark complete'
    end
  end

  def completed?
    page.has_css? 'li.complete', text: @title
  end

  def present?
    page.has_css? 'li', text: @title
  end
end
