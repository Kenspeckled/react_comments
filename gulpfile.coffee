gulp = require 'gulp'
gutil = require 'gutil'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'
slim = require 'gulp-slim'
sass = require 'gulp-sass'
concat = require 'gulp-concat'
cache = require 'gulp-cached'
rename = require 'gulp-rename'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
coffeeify = require 'coffeeify'


gulp.task 'libs', ->
  gulp.src [
    'bower_components/es6-shim/es6-shim.min.js'
    'bower_components/lodash/lodash.js'
    'bower_components/react/react.js'
  ]
  .pipe concat 'libs.js'
  .pipe gulp.dest 'public'
  gulp.src [
    'bower_components/es6-shim/es6-shim.map'
  ]
  .pipe gulp.dest 'public'

gulp.task 'browserify', ->
  bundler = browserify('./app/client/application.coffee', {})
  bundler.transform('coffeeify')
  bundle = ->
    bundler.bundle()
      .on('error', gutil.log.bind(gutil, 'Browserify Error'))
      .pipe source('app.js')
      .pipe buffer()
      .pipe gulp.dest 'public'
      .pipe uglify()
      .pipe rename({suffix: '.min'})
      .pipe gulp.dest 'public'
  bundle()

gulp.task 'assets', ->
  gulp.src 'assets/images/**/*'
  .pipe gulp.dest 'public/images'
  gulp.src 'assets/fonts/**/*'
  .pipe gulp.dest 'public/fonts'

gulp.task 'sass', ->
  gulp.src 'assets/stylesheets/styles.sass'
  .pipe sass(
    indentedSyntax: true
    outputStyle: 'nested'
  )
  .pipe gulp.dest 'public/stylesheets'
  gulp.src 'assets/stylesheets/styles.sass'
  .pipe sass(
    indentedSyntax: true
    outputStyle: 'compressed'
  )
  .pipe rename({suffix: '.min'})
  .pipe gulp.dest 'public/stylesheets'

gulp.task 'slim', ->
  gulp.src ['app/**/[^_]*.slim', 'index.slim']
  .pipe(cache('slim'))
  .pipe slim(
    pretty: true
    )
  .pipe gulp.dest 'public'

# Add a watcher to change any files
gulp.task 'watch', ->
  gulp.watch 'app/**/*.coffee', ['browserify']
  gulp.watch '_app.main.coffee', ['browserify']
  gulp.watch 'app/**/*.slim', ['slim']
  gulp.watch 'index.slim', ['slim']
  gulp.watch 'app/**/*.sass', ['sass']

# Default task will call all tasks created so far
gulp.task 'default', ['browserify', 'libs', 'assets', 'slim', 'sass', 'watch']
