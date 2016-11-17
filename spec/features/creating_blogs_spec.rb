require 'rails_helper'

RSpec.feature "CreatingBlogs", type: :feature do
  #As a logged in user, I can create a blog post with title and messgae on the welcome back page.
  context 'Creating a blog post' do
    Steps 'To create and submit a blog post' do
      Given 'I have registered and logged in as a user' do
        visit '/'
        click_on 'New User'
        fill_in 'Full name', with: 'Sang Yub Kim'
        fill_in 'Email', with: 's@kim.com'
        fill_in 'Password', with: 'password'
        click_on 'Create User'
        expect(page).to have_content 'User was successfully created.'
        expect(page).to have_content 'Sang Yub Kim'
        click_on 'Back'
        fill_in 'login_email', with: 's@kim.com'
        fill_in 'login_password', with: 'password'
        click_on 'Log In'
        expect(page).to have_content('Welcome back, Sang Yub Kim!')
      end
      Then 'I can create a blog post' do
        click_on "Start blogging!"
        click_on "New Blog"
        fill_in "Title", with: "First Post!"
        fill_in "Message", with: "Hej hej hej this is my first post!"
        click_on "Create Blog"
      end
      #As a logged in user, I can see all my blog posts with the title on the welcome back page
      And "I can see all my blog posts on the page" do
        click
      end
    end #end of steps
  end #end of context


end
