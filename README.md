# Redmine User-Specific Theme Plugin

[![Build Status](https://travis-ci.org/Undev/redmine_user_specific_theme.png)](https://travis-ci.org/Undev/redmine_user_specific_theme)
[![Code Climate](https://codeclimate.com/github/Undev/redmine_user_specific_theme.png)](https://codeclimate.com/github/Undev/redmine_user_specific_theme)

This plugin allows Redmine users to select themes in their account settings. The selected theme will be displayed for the user regardless of the system-wide theme settings.

## Compatibility

This plugin version is compatible only with Redmine 3.x and later.  
<sup>**note: Tested just on *Redmine 3.1*</sup>  

## Installation

1. To install the plugin
    * Download the .ZIP archive, extract files and copy the plugin directory into *#{REDMINE_ROOT}/plugins*.
    
    Or

    * Change you current directory to your Redmine root directory:  

            cd {REDMINE_ROOT}
 
      Copy the plugin from GitHub using the following command:

            git clone https://github.com/Undev/redmine_user_specific_theme.git plugins/redmine_user_specific_theme

2. Install the required gems using the command:  

        bundle install  

    * In case of bundle install errors, remove the Gemfile.lock file, update the local package index and install the required dependencies. Then execute the `bundle install` command again:  

            rm Gemfile.lock
            sudo apt-get update
            sudo apt-get install -y libxml2-dev libxslt-dev libpq-dev
            bundle install

3. Restart Redmine.

Now you should be able to see the plugin in **Administration > Plugins**.

## Usage

The plugin adds the **Theme** setting to the user account. If the **Theme** setting is blank, then the system-wide theme is applied; otherwise, the selected theme is displayed.
![user theme](user_specific_theme_1.png)

## Maintainers

Danil Tashkinov, [github.com/nodecarter](https://github.com/nodecarter)

## License

Copyright (c) 2015 Undev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.