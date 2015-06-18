module SessionHelpers

  def sign_up(email = 'rodney@mail.com')
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: email
    fill_in 'Password', with: 'test1234'
    fill_in 'Password confirmation', with: 'test1234'
    click_button 'Sign up'
  end

  def sign_in(email = 'fiona@mail.com')
    User.create(email: email, password: 'test1234')
    visit '/users/sign_in'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test1234'
    click_button 'Log in'
  end

  def create_restaurant(name = 'Elven Sweets')
    visit '/restaurants'
    click_link 'Add a restaurant'
    fill_in 'Name', with: name
    click_button 'Create Restaurant'
  end
end
