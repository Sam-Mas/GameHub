# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( _coingame.js )
Rails.application.config.assets.precompile += %w( qunit.css )
Rails.application.config.assets.precompile += %w( test_helper.css )
Rails.application.config.assets.precompile += %w( qunit.js )
Rails.application.config.assets.precompile += %w( test_helper.js )


# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
