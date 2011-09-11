require "#{File.dirname(__FILE__)}/../../test/test_helper"

class UserCheckTest < ActionDispatch::IntegrationTest
  setup do
    @user = Factory(:user)
  end
  
  test 'login' do
    #Factory(:user)
    visit '/users/sign_in'
    fill_in 'Email', :with => 'test@example.pl'
    fill_in 'Password', :with => 'secret'
    save_page
    assert_difference '@user.reload.sign_in_count' do
      click_button 'Sign in'
    end
    assert page.has_content?('Signed in successfully.')
  end
  
  test 'login with wrong params' do
    visit '/users/sign_in'
    fill_in 'Email', :with => 'test@example.pl'
    fill_in 'Password', :with => 'secrets'
    save_page
    click_button 'Sign in'
    save_page
    assert_equal 0, @user.reload.sign_in_count
    assert page.has_content?('Invalid email or password.')
  end
end
