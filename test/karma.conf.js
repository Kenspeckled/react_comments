module.exports = function(config){
  config.set({

    plugins : [
      'karma-phantomjs-launcher',
      //'karma-chrome-launcher',
      'karma-jasmine',
      //'karma-verbose-reporter',
      'karma-coffee-preprocessor',
    ],

    basePath : '../',

    preprocessors: {
      'test/**/*.coffee': ['coffee']
    },

    coffeePreprocessor: {
      // options passed to the coffee compiler
      options: {
        bare: true,
        sourceMap: false
      },
      // transforming the filenames
      transformPath: function(path) {
        return path.replace(/\.coffee$/, '.js');
      }
    },

    files : [
      'test/bind-polyfill.js', //PhantomJS ployfill
      'public/libs.js',
      'test/**/*.coffee'
    ],

    autoWatch : true,

    frameworks: ['jasmine'],

    browsers: [
      'PhantomJS',
      //'Chrome'
    ],

    reporters: ['dots']

  });
};
