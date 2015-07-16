# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.

# Stylesheets
Rails.application.config.assets.precompile += ['home/creative.css', 'home/animate.css']

# Javascripts
Rails.application.config.assets.precompile += ['home/jquery.easing.min.js', 'home/jquery.fittext.js', 'home/wow.min.js', 'home/creative.js']