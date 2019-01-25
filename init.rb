require 'redmine'

Redmine::Plugin.register :redmine_user_specific_theme do
  name        'Redmine User-Specific Theme Plugin'
  description 'This plugin allows users to set Redmine themes in the account settings.'
  author      'Restream'
  version     '2.2.0'
  url         'https://github.com/Restream/redmine_user_specific_theme'

  requires_redmine :version_or_higher => '4.0'
end

require 'redmine_user_specific_theme'
