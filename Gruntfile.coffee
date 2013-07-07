module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-simple-mocha'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    simplemocha:
      options:
        globals: ['should','$']
        timeout: 3000
        ignoreLeaks: false
        ui: 'bdd'
        reporter: 'tap'
        compilers: 'coffee:coffee-script'
      all:
        src: 'test/**/*.coffee'

    coffee:
      compile:
        options:
          join:true
        files: [
            expand: true,
            cwd: 'src',
            src: '**/*.coffee'
            dest: 'js/',
            ext: '.js'
        ]


  grunt.registerTask "default", ["simplemocha","coffee"]
