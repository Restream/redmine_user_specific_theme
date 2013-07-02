require 'redmine'
require 'redmine_user_specific_theme'

Rails.application.paths["app/overrides"] ||= []
Rails.application.paths["app/overrides"] << File.expand_path("../app/overrides", __FILE__)

Redmine::Plugin.register :redmine_user_specific_theme do
  name        'Redmine user specific theme plugin'
  description 'Theme setting at the user account'
  author      'Danil Tashkinov'
  version     '0.0.1'
  url         'https://github.com/Undev/redmine_user_specific_theme'

  requires_redmine :version_or_higher => '2.1'
end
