require 'rails_helper'

RSpec.feature "CreatingBlogs", type: :feature do
  #As a logged in user, I can create a blog post with title and messgae on the welcome back page.
  context 'Creating a blog post' do
    Steps 'To create and submit a blog post' do
      #create a new user in the database using the registration form, and log him in
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
        fill_in "title", with: "First Post!"
        fill_in "message", with: "Hej hej hej this is my first post!"
        click_on "Create Blog"
      end
      And 'I can create another blog post' do
        click_on "Back"
        click_on "New Blog"
        fill_in "Title", with: "Second blog post evaaa"
        fill_in "Message", with: "LOVE ME BLUEEEEEEEEEEEEE"
        click_on "Create Blog"
      end
      #As a logged in user, I can see all my blog posts with the title on the welcome back page
      And "I can see all my blog posts on the page" do
        click_on "Back"
        expect(page).to have_content("First Post!")
        expect(page).to have_content("Second blog post evaaa")
      end
      #As a logged in user, when I click on a blog title on the Welcome Back page, I am taken to a page showing the blog title and message.
      Then 'I can click on a blog title and be shown the blog title and message in a new page' do
        visit '/users/welcome'
        click_on "First Post!"
        expect(page).to have_content("Hej hej hej this is my first post!")
      end

    end #end of steps
  end #end of context


end
