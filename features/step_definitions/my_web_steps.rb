Given /^the blog has the following users:$/ do |fields|
  fields.rows.each do |login, password, email, profile_id, name, state|
    User.create!({:login => login,
                :password => password,
                :email => email,
                :profile_id => profile_id,
                :name => name,
                :state => state})
  end
end

Given /^I have logged in in the admin panel as user "(.*)"$/ do |login_name|
  user = User.where(login: login_name).first

  visit '/accounts/login'

  fill_in 'user_login', :with => user.login
  fill_in 'user_password', :with => user.name #heck to bypass the hashed db password
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end

end

Given /^the following articles exist:$/ do |fields|
  user = User.where(login: 'non_admin').first
  fields.rows.each do |user, title, body|
    User.where(login: user).first.articles.create!(:title => title,
                                                   :body => body)
  end
end

Given /^I edit article "(.*)"$/ do |article_title|
  visit '/admin/content/edit/' + Article.where(title: article_title).first.id.to_s
end

Given /^the following comments exist:$/ do |fields|
  user = User.where(login: 'non_admin').first
  fields.rows.each do |user, title, author, body|
    user_id = User.where(login: user).first.id.to_s
    article_id = Article.where(title: title).first.id.to_s
    Comment.create!(:user_id => user_id,
                    :article_id => article_id,
                    :author => author,
                    :body => body)
  end
end

Given /^I view the comments for article "(.*)"$/ do |article_title|
  visit '/admin/feedback/article/' + Article.where(title: article_title).first.id.to_s
end

Given /^I merge article "(.*)" with article "(.*)"$/ do |article_title_source, article_title_target|

  visit '/admin/content/edit/' + Article.where(title: article_title_source).first.id.to_s

  fill_in 'merge_with', :with => Article.where(title: article_title_target).first.id.to_s
  click_button 'Merge'

end
