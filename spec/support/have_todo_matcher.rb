RSpec::Matchers.define :have_todo do |title|
  match do |page|
    page.has_css? 'li', text: title
  end
end
