require_dependency 'my_controller'

module RedmineUserSpecificTheme
  module Patches
    module UserPreferencePatch
      def account
        Rails.logger.info "Account with theme patch applied"
        if request.put? && params[:pref]
          theme = params[:pref][:ui_theme]
          User.current.pref.others[:ui_theme] = theme if theme
          User.current.pref.save
          Rails.logger.info "Saved theme: #{theme}"
        end
        super
      end

    end
  end
end
