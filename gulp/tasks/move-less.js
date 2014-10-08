/**
 * Compile less/css and output into build.
 */

var gulp = require('gulp');
var changed = require('gulp-changed');
var less = require('gulp-less')
var handleErrors = require('../util/handleErrors');
var prefix = require('gulp-autoprefixer');
var config = require('../config').less;

gulp.task('less', function(){
  return gulp.src(config.src)
    .pipe(changed(config.dest)) // Ignore unchanged files
    .pipe(less())
    // Add vendor prefixes
    .pipe(prefix())
    .on('error', handleErrors)
    .pipe(gulp.dest(config.dest));
});
