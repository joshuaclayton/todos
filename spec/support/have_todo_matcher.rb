RSpec::Matchers.define :have_todo do |title|
  match do |page|
    page.has_css? 'li', text: title
  end
end

RSpec::Matchers.define :have_completed_todo do |title|
  match do |page|
    page.has_css? 'li.complete', text: title
  end
end
