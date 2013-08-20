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

Given /^the user "(.*)" is logged into the admin panel$/ do |login_name|
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


Given /^I edit article (\d+)$/ do |article_id|
  visit '/admin/content/edit/' + article_id
end
