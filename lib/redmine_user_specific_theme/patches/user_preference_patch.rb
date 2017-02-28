require_dependency 'user_preference'

module RedmineUserSpecificTheme
  module Patches
    module UserPreferencePatch

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
end
