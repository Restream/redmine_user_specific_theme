require 'user_preference'

module RedmineUserSpecificTheme::Patches
  module UserPreferencePatch
    extend ActiveSupport::Concern

    def ui_theme
      self[:ui_theme]
    end

    def ui_theme=(val)
      self[:ui_theme] = val
    end

    def ui_theme?
      ui_theme.blank?
    end

  end
end

unless UserPreference.included_modules.include?(RedmineUserSpecificTheme::Patches::UserPreferencePatch)
  UserPreference.send :include, RedmineUserSpecificTheme::Patches::UserPreferencePatch
end
