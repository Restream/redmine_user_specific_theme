require_dependency 'user_preference'

module RedmineUserSpecificTheme
  module Patches
    module UserPreferencePatch

      def self.prepended(base)
        base.class_eval do
          if defined? safe_attributes
            safe_attributes :ui_theme
          end
        end
      end

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
