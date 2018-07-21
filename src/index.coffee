module.exports = ->
  @hook 'config', =>
    @get('uglify') == false or
      @worker 'worker.js'
