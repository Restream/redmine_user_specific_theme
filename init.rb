require 'redmine'
require 'redmine_user_specific_theme'

Rails.application.paths["app/overrides"] ||= []
Rails.application.paths["app/overrides"] << File.expand_path("../app/overrides", __FILE__)

Redmine::Plugin.register :redmine_user_specific_theme do
  name        'Redmine User-Specific Theme Plugin'
  description 'This plugin allows users to set Redmine themes in the account settings.'
  author      'Undev'
  version     '1.0.0'
  url         'https://github.com/Undev/redmine_user_specific_theme'

  requires_redmine :version_or_higher => '2.1'
end
