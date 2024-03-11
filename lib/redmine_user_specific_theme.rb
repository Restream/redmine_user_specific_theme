module RedmineUserSpecificTheme
end



MyController.prepend RedmineUserSpecificTheme::Patches::UserPreferencePatch unless MyController.included_modules.include?(RedmineUserSpecificTheme::Patches::UserPreferencePatch)

RedmineApp::Application.config.after_initialize do
  ApplicationHelper.prepend(RedmineUserSpecificTheme::Patches::ApplicationHelperPatch)
end