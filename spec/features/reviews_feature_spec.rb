require 'rails_helper'
require_relative 'helpers/session'
include SessionHelpers

feature 'reviewing' do
  before do
    sign_up
    create_restaurant('KFC')
  end

  def leave_review(thoughts, rating)
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'animal cruelty - stay away!'
    select '1', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('animal cruelty - stay away!')
  end

  scenario 'user must log in to add a review' do
    click_link 'Sign out'
    visit '/restaurants'
    click_link 'Review KFC'
    expect(page).to have_content('Log in')
  end

  scenario 'displays an average rating for all reviews' do
    leave_review('So so', '3')
    click_link 'Sign out'
    sign_up 'fiona@mail.com'
    visit '/restaurants'
    leave_review('Magical wonderland', '5')
    expect(page).to have_content('Average rating: 4')
  end

end
