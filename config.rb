Ichiban.config do |cfg|
  # If your site lives under a sub-path specify that here. For example, if your site lives
  # under http://example.com/my-site, then the relative_url_root should be '/my-site'.
  cfg.relative_url_root = '/'
  
  # Specifies what must be recompiled when files change. For example, the following rule:
  #
  #   'layouts/default.html' => ['html/**/*', 'scripts/**/*']
  #
  # means that when layouts/default.html changes, everything in the html and scripts
  # folders must be recompiled.
  cfg.dependencies = {
    'layouts/default.html' => ['html/**/*', 'scripts/**/*'],
    'assets/css/library.scss' => 'assets/css/screen.scss',
    'assets/css/typography.scss' => 'assets/css/screen.scss',
    'assets/css/home.scss' => 'assets/css/screen.scss',
    'assets/css/manual.scss' => 'assets/css/screen.scss'
  }
  
  # Configures JavaScript compilation. Each hash key is the name of a concatenated,
  # minified JS file. Each hash value is an array of source files in the assets/js
  # folder. For example, the following rule:
  # 
  #   'site.js' => ['home.js', 'popups.js']
  # 
  # would generate compiled/js/site.js and compiled/js/site.js.map, using the source files
  # assets/js/home.js and assets/js/popups.js.
  cfg.js_manifests = {
    'site.js' => ['home-slides.js']
  }
  
  # Identify the SCSS files in assets/css that should be compiled into final CSS files.
  # Often, many of your SCSS files are simply imported into other SCSS files--in
  # other words, they don't map to their own, distinct CSS files. Make sure that
  # cfg.dependencies covers any SCSS imports. Otherwise, saving the imported file won't
  # update the root file.
  cfg.scss_root_files = ['screen.scss']
end