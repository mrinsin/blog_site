require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  #As a registered userI can go to the website and register with a full name, email and assword, and be taken to a page showing my registration confirmation
  context 'Registering as a User' do
    Steps 'To register as a user' do
      Given 'I am on the index page' do
        visit '/'
      end
      Then 'I can fill out a registration form' do
        click_on 'New User'
        fill_in 'Full name', with: 'Sang Yub Kim'
        fill_in 'Email', with: 's@kim.com'
        fill_in 'Password', with: 'password'
        click_on 'Create User'
      end
      And 'I am taken to a registration confirmation page' do
        expect(page).to have_content 'User was successfully created.'
        expect(page).to have_content 'Sang Yub Kim'
        expect(page).to have_content 's@kim.com'
      end
    end #end of steps
  end #end of context

  #As a registered user, I can go to the website and log in with email and passwordm and be taken to a page showing my login success
  context 'Logging in as a registered user' do
    Steps 'logging in from the index page' do
      Given 'I have registered as a user' do
        visit '/'
        click_on 'New User'
        fill_in 'Full name', with: 'Sang Yub Kim'
        fill_in 'Email', with: 's@kim.com'
        fill_in 'Password', with: 'password'
        click_on 'Create User'
        expect(page).to have_content 'User was successfully created.'
        expect(page).to have_content 'Sang Yub Kim'
        click_on 'Back'
      end

      Then 'I can log in from the index page' do
        fill_in 'login_email', with: 's@kim.com'
        fill_in 'login_password', with: 'password'
        click_on 'Log In'
      end

      And 'I am taken to a welcome back page' do
        expect(page).to have_content('Welcome back, Sang Yub Kim!')
      end
    end #end of steps
  end #end of context

end
