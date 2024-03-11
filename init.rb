require 'redmine'

Redmine::Plugin.register :redmine_user_specific_theme do
  name        'Redmine User-Specific Theme Plugin'
  description 'This plugin allows users to set Redmine themes in the account settings.'
  author      'Restream'
  version     '1.3.0'
  url         'https://github.com/Restream/redmine_user_specific_theme'

  requires_redmine :version_or_higher => '4.0.0'


end

require_relative 'lib/redmine_user_specific_theme/hooks/view_hooks'
require_relative 'lib/redmine_user_specific_theme/patches/user_preference_patch'
require_relative 'lib/redmine_user_specific_theme/patches/application_helper_patch'
require_relative 'lib/redmine_user_specific_theme'
