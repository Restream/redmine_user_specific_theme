module RedmineUserSpecificTheme
end

ActionDispatch::Callbacks.to_prepare do
  require 'redmine_user_specific_theme/patches/user_preference_patch'
  require 'redmine_user_specific_theme/patches/application_helper_patch'
end
