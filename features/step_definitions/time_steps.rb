Given /^today is "(.*?)"$/ do |date|
  today = Date.parse(date)
  Timecop.freeze today
end

After do
  Timecop.return
end
