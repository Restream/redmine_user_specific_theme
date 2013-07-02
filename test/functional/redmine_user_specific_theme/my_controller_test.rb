require File.expand_path('../../../test_helper', __FILE__)
require 'my_controller'

class RedmineUserSpecificTheme::MyControllerTest < ActionController::TestCase
  fixtures :users, :user_preferences, :roles, :projects, :members, :member_roles,
           :issues, :issue_statuses, :trackers, :enumerations, :custom_fields,
           :auth_sources

  def setup
    @controller = MyController.new
    @request    = ActionController::TestRequest.new
    @request.session[:user_id] = 2
    @response   = ActionController::TestResponse.new
    @user_theme = Redmine::Themes.themes.last
  end

  def test_update_user_ui_theme
    user = User.find(2)
    user.pref.ui_theme = nil
    user.pref.save!
    post :account,
         :pref => {
             :ui_theme => @user_theme.id
         }
    assert_redirected_to '/my/account'
    user = User.find(2)
    assert_equal @user_theme.id, user.pref.ui_theme
  end

  def test_show_ui_theme
    get :account
    assert_tag :select, :attributes => { :name => 'pref[ui_theme]' }
  end
end
