require File.expand_path('../../../test_helper', __FILE__)

class RedmineUserSpecificTheme::ApplicationHelperTest < ActiveSupport::TestCase
  fixtures :users
  include ApplicationHelper

  def setup
    @user = User.find(1)
    User.current = @user
    @standard_theme = Redmine::Themes.themes.first
    @user_theme = Redmine::Themes.themes.last
    self.stubs(:controller_name).returns('fakecontroller')
    self.stubs(:action_name).returns('fakeaction')
    assert_not_equal @standard_theme.id,
                     @user_theme.id,
                     'At least two themes must exists to these tests'
  end

  def test_current_theme_match_user_specific_theme
    @user.pref.ui_theme = @user_theme
    @user.pref.save!

    with_settings :ui_theme => @standard_theme.id do
      assert_equal @user_theme.id, current_theme.id
      assert_match /.*theme-#{@user_theme.name}.*/, body_css_classes
    end
  end

  def test_current_theme_with_nil_user_specific_theme
    @user.pref.ui_theme = nil
    @user.pref.save!

    with_settings :ui_theme => @standard_theme.id do
      assert_equal @standard_theme.id, current_theme.id
      assert_match /.*theme-#{@standard_theme.name}.*/, body_css_classes
    end
  end

  def test_current_theme_with_wrong_user_specific_theme
    @user.pref.ui_theme = 'wrong'
    @user.pref.save!

    with_settings :ui_theme => @standard_theme.id do
      assert_equal @standard_theme.id, current_theme.id
      assert_match /.*theme-#{@standard_theme.name}.*/, body_css_classes
    end
  end

end
