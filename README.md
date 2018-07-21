# cush-plugin-uglify-js v0.0.1

Minify assets using [uglify-js](https://github.com/mishoo/UglifyJS2).

By default, minification occurs in both development *and* production modes. This way, you can catch any rare bugs caused by minification, resulting in a better user experience.

The default settings for minification were carefully selected to avoid losing
information that's necessary for useful source maps. Transforms which are
unlikely to cause bugs are disabled in development mode for performance.

## Configuration

The `uglify` setting can be configured by your `cush.config.js` module.
Set it to false to disable minification, or provide [uglify options][opts]
to customize how modules are minified.

[opts]: https://github.com/mishoo/UglifyJS2#minify-options

```js
// Inline single-use variables and functions, but make source maps less useful.
this.set('uglify', {
  compress: {
    inline: true,
    reduce_vars: true,
    reduce_funcs: true,
    collapse_vars: true,
  }
});
```

## Default settings

You can override any of these defaults.

The "always disabled" settings typically reduce the usefulness of source maps or slow down the build process more than they're worth.

**Always disabled:**
- `compress`
  - `collapse_vars`
  - `hoist_props`
  - `inline`
  - `loops`
  - `properties`
  - `reduce_funcs`
  - `reduce_vars`
  - `side_effects`
  - `typeofs`
  - `warnings`

**Production only:**
- `mangle`
- `toplevel`
- `warnings`
- `keep_fnames: false`
- `output`
  - `beautify`
  - `semicolons`
  - `quote_style: 0`
- `compress`
  - `arguments`
  - `booleans`
  - `comparisons`
  - `conditionals`
  - `dead_code`
  - `drop_debugger`
  - `evaluate`
  - `if_returns`
  - `join_vars`
  - `sequences`
  - `switches`
  - `unused`
