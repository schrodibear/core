Here we demonstrate tab completion

  $ demo_help.exe help -recursive
  this command does stuff
  
    demo_help.exe SUBCOMMAND
  
  === subcommands ===
  
    adverb       this command does more stuff
    . drolly     this command does stuff here
    . opposable  this command does stuff here
    jab          this command does stuff here
    jib          this command does stuff here
    version      print version information
    help         explain a given subcommand (perhaps recursively)
  
Tab completion works for subcommands ...

  $ tab-complete demo_help.exe ''
  adverb
  help
  jab
  jib
  version

  $ tab-complete demo_help.exe 'j'
  jab
  jib

  $ tab-complete demo_help.exe 'jab'
  jab

... at all positions in the command hierarchy.

  $ tab-complete demo_help.exe adverb ''
  drolly
  help
  opposable

  $ tab-complete demo_help.exe adverb 'dr'
  drolly

Tab completion works for flag names.

  $ tab-complete demo_help.exe jab '-'
  -help
  -ping
  -pong

  $ tab-complete demo_help.exe jab '-p'
  -ping
  -pong

  $ tab-complete demo_help.exe jab '-pi'
  -ping

  $ tab-complete demo_help.exe jab '-ping'
  -ping

Tab completion works for [Arg_type.t] values which have defined it:
both for flag arguments ...

  $ tab-complete demo_help.exe jab -pong ''
  bar
  baz
  foo

  $ tab-complete demo_help.exe jab -pong 'ba'
  bar
  baz

  $ tab-complete demo_help.exe jab -pong 'bar'
  bar

... and anonymous arguments (assumed not to be flags).

  $ tab-complete demo_help.exe jab ''
  bar
  baz
  foo

  $ tab-complete demo_help.exe jab 'ba'
  bar
  baz

  $ tab-complete demo_help.exe jab 'bar'
  bar
