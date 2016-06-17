// Include gulp
var gulp = require('gulp');
// Include plugins
var concat = require('gulp-concat');
var order = require('gulp-order');
// Concatenate JS Files
gulp.task('scripts-libs', function () {
    return gulp.src([
        'libraries/jquery/jquery-1.12.3.min.js',
        'libraries/angular/angular.min.js',
        'libraries/angular/angular-material.min.js',
        'libraries/angular/angular-sanitize.min.js',
        'libraries/angular/angular-animate.min.js',
        'libraries/angular/angular-aria.min.js',
        'libraries/ui-router/angular-ui-router.min.js',
        'libraries/ngStorage/ngStorage.min.js'
    ])
      .pipe(concat('libraries.min.js'))
      .pipe(gulp.dest('assets/js'));
});

gulp.task('scripts-app', function () {
    return gulp.src([
        'assets/js/app.module.js',
        'assets/js/app.config.js',
        'core-components/**/*.js',
        'shared-components/**/*.js'
    ])
      .pipe(order([
          'app.module.js',
          '**/module.js'
      ]))
      .pipe(concat('dist.js'))
      .pipe(gulp.dest('assets/js'));
});

gulp.task('css-app', function () {
    return gulp.src([
        'libraries/bootstrap/bootstrap.min.css',
        'libraries/angular/angular-material.min.css',
        'assets/css/style.css',
        'core-components/**/*.css',
        'shared-components/**/*.css'
    ])
      .pipe(concat('dist.css'))
      .pipe(gulp.dest('assets/css'));
});


// Default Task
gulp.task('default', ['scripts-libs', 'scripts-app', 'css-app']);