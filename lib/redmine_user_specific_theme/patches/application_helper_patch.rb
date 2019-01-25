require 'application_helper'

module RedmineUserSpecificTheme::Patches
  module ApplicationHelperPatch
    extend ActiveSupport::Concern

    def current_theme
      user_theme = super
      user_theme = Redmine::Themes.theme(User.current.pref.ui_theme)
      user_theme || Redmine::Themes.theme(Setting.ui_theme)
    end

    def body_css_classes
      css_classes = super
      css_classes = body_css_classes_without_user_specific
      user_theme = Redmine::Themes.theme(User.current.pref.ui_theme)
      user_theme ?
          css_classes.gsub(/theme-\S+/, "theme-#{user_theme.name}") :
          css_classes
    end

  end
end
Redmine::Themes.prepend(RedmineUserSpecificTheme::Patches::ApplicationHelperPatch)

