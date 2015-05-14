Deface::Override.new(
    :virtual_path => 'users/_preferences',
    :name => 'user_ui_theme_preference',
    :insert_before => 'code[erb-silent]:contains("end"):last',
    :text => '<p><%= pref_fields.select :ui_theme, Redmine::Themes.themes.collect {|t| [t.name, t.id]}, { :include_blank => true } %></p>')
