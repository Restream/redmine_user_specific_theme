require 'application_helper'

module RedmineUserSpecificTheme::Patches
  module ApplicationHelperPatch
    extend ActiveSupport::Concern

    included do
      alias_method_chain :current_theme, :user_specific
      alias_method_chain :body_css_classes, :user_specific
    end

    def current_theme_with_user_specific
      user_theme = Redmine::Themes.theme(User.current.pref.ui_theme)
      user_theme || Redmine::Themes.theme(Setting.ui_theme)
    end

    def body_css_classes_with_user_specific
      css_classes = body_css_classes_without_user_specific
      user_theme = Redmine::Themes.theme(User.current.pref.ui_theme)
      user_theme ?
          css_classes.gsub(/theme-\S+/, "theme-#{user_theme.name}") :
          css_classes
    end

  end
end
