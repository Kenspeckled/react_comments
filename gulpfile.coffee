gulp = require 'gulp'
coffee = require 'gulp-coffee'
slim = require 'gulp-slim'
sass = require 'gulp-sass'
concat = require 'gulp-concat'
cache = require 'gulp-cached'

gulp.task 'libs', ->
  gulp.src [
    'bower_components/lodash/lodash.js'
  ]
  .pipe concat 'libs.js'
  .pipe gulp.dest 'public'

gulp.task 'assets', ->
  gulp.src 'app/assets/images/**/*'
  .pipe gulp.dest 'public/assets/images'
  gulp.src 'app/assets/fonts/**/*'
  .pipe gulp.dest 'public/assets/fonts'

gulp.task 'coffee', ->
  gulp.src 'app/**/*.coffee'
  .pipe(cache('coffee'))
  .pipe coffee()
  .pipe gulp.dest 'public'

gulp.task 'slim', ->
  gulp.src ['app/**/[^_]*.slim', 'index.slim']
  .pipe(cache('slim'))
  .pipe slim(
    pretty: true
    options: "attr_list_delims={'(' => ')', '[' => ']'}"
    )
  .pipe gulp.dest 'public'

gulp.task 'sass', ->
  gulp.src 'app/**/[^_]*.sass'
  .pipe sass(
    indentedSyntax: true
    outputStyle: 'nested'
  )
  .pipe gulp.dest 'public'

# Add a watcher to change any files
gulp.task 'watch', ->
  gulp.watch 'app/**/*.coffee', ['coffee']
  gulp.watch 'index.slim', ['slim']
  gulp.watch 'app/**/*.slim', ['slim']
  gulp.watch 'app/**/*.sass', ['sass']

# Default task will call all tasks created so far
gulp.task 'default', ['libs', 'assets', 'coffee', 'slim', 'sass', 'watch']
