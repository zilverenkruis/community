var gulp = require('gulp');
var gutil = require('gulp-util');
var postcss = require('gulp-postcss');
var autoprefixer = require('autoprefixer');
var precss = require('precss');
var cssnano = require('cssnano');

var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
// var mqpacker = require('css-mqpacker');
// var csswring = require('csswring');
var source = 'src/',
    sourceJS = source + 'js/',
    dest = 'build/';

gulp.task('css', function() {
  gulp.src(source + 'css/*.css')
  .pipe(postcss([
    // colorfunctions(),
    precss()
    ,autoprefixer()
    
    // ,cssnano()
  ]))
  .on('error', gutil.log)
  .pipe(gulp.dest(dest + 'css'));
});

var jsFiles = [
    sourceJS + 'community-main.js',
    sourceJS + 'community-restructure-html.js',
    sourceJS + 'community-removeEmptyRows.js',    
    sourceJS + 'community-svg-corner.js',
    // sourceJS + 'community-avatars-old-ideas.js',
    sourceJS + 'community-avatars.js',    
    sourceJS + 'community-shorten-message.js',    
    sourceJS + 'community-accordion.js',
    sourceJS + 'community-scrollTo.js',
    sourceJS + 'community-comment-count.js',
    sourceJS + 'community-filter-dropdown.js',
    // sourceJS + 'community-correct-bg-height.js',
    sourceJS + 'community-create-bg.js',
    sourceJS + 'community-social.js',
    sourceJS + 'community-onload.js'
]

gulp.task('js', function() {
//   gulp.src(source + 'js/*.js')
  gulp.src(jsFiles)
  .pipe(concat('2016-zk-community.js', {newLine: ';'}))
//   .pipe(uglify())
  .on('error', gutil.log)
  .pipe(gulp.dest(dest + 'js'));
});

// gulp.task('css', function () {
//     return gulp.src('./src/*.css').pipe(
//         postcss([
//             require('precss')({ /* options */ }),
//             require('cssnano')({ /* options */ })            
//         ])
//     ).pipe(
//         gulp.dest('./build')
//     );
// });



gulp.task('watch', function() {
  gulp.watch(source + 'css/**/*.css', ['css']);
  gulp.watch(source + 'js/**/*.js', ['js']);
//   gulp.watch(dest + '**/*.html', ['html']);
});


gulp.task('default', ['css', 'js', 'watch'], function () {
    //gulp.watch("public/js/*.js", ['js-watch']);
    // gulp.watch("public/*.html").on('change', browserSync.reload);
});

// gulp.task('css', function () {
//     var processors = [
//         autoprefixer({browsers: ['last 1 version']})
//         // ,mqpacker,
//         // csswring
//     ];
//     return gulp.src('./src/*.css')
//         .pipe(postcss(processors))
//         .pipe(gulp.dest('./build'));
// });