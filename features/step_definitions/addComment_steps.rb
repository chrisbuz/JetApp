s = Capybara::Session.new(:selenium)

Given(/^that I have logged in$/) do
	window_max(s)
	s.visit path_to(host)
	s.click_link("login")
	log_in(s)
end

Given(/^I have clicked "(.*?)"$/) do |arg1|
  s.click_link(arg1)
end

Given(/^then I click on "(.*?)"$/) do |arg1|
  s.first('a', text: arg1).click
end

When(/^I enter "(.*?)" in a "(.*?)" field$/) do |arg1, arg2|
	s.within("div.field") do
		s.find('label', text: arg2).set(arg1)
	end
end

When(/^I enter "(.*?)" in the comment body$/) do |arg1|
	s.within("div.field") do
		s.find('#comment_body').set(arg1)
	end
end

When(/^click "(.*?)" and go back to that Idea$/) do |arg1|
  s.click_button("Add Comment")
  s.click_link("JetPack Logo")
  s.click_link("All Ideas")
end

Then(/^I should see my comment under that Idea$/) do
  s.click_link('a', text: "Some Idea Edited")
  s.first('div.showHide', text: "Some Comment")
end


