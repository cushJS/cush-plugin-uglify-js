isObject = require 'is-object'
merge = require 'cush/utils/merge'
log = require 'lodge'

module.exports = (config) ->
  prod = !@dev

  config =
    sourceMap: {json: false}
    mangle: prod
    toplevel: prod
    warnings: prod
    keep_fnames: @dev
    output:
      beautify: prod
      semicolons: prod
      quote_style: if prod then 0 else 3
    compress:
      unused: prod
      booleans: prod
      evaluate: prod
      switches: prod
      arguments: prod
      if_return: prod
      dead_code: prod
      join_vars: prod
      sequences: prod
      comparisons: prod
      conditionals: prod
      drop_debugger: prod
      loops: false
      inline: false
      typeofs: false # IE10 compat
      properties: false
      hoist_props: false
      reduce_vars: false
      reduce_funcs: false
      side_effects: false
      collapse_vars: false
      global_defs:
        DEBUG: @dev
        ENV: @target

  if isObject custom = @get('uglify')
    merge config, custom

  {minify} = require '@cush/uglify-js'

  @transform '.js', (asset) =>
    result = minify asset.content, config

    if err = result.error
      throw Object.assign {
        message: err.message
        stack: err.stack
      }, err

    result.map.sources[0] = @relative asset.path
    result
