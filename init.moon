howl.mode.register
  name: 'k'
  extensions: {'k'}
  create: -> bundle_load 'mode'
  parent: 'curly_mode'

unload = -> howl.mode.unregister 'k'

{
  info:
    author: 'Ryan Gonzalez'
    description: 'A K bundle'
    license: 'MIT'
  :unload
}
