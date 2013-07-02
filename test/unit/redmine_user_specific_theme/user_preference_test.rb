require File.expand_path('../../../test_helper', __FILE__)

class RedmineUserSpecificTheme::UserPreferenceTest < ActiveSupport::TestCase
  fixtures :users

  def test_set_user_ui_theme
    user = User.find(1)
    theme = Redmine::Themes.themes.last
    user.pref.attributes = { 'ui_theme' => theme.id }
    user.pref.save!
    user = User.find(1)
    assert_equal theme.id, user.pref.ui_theme
  end

end
