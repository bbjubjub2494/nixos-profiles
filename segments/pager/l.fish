function l  --description "call less, smartly: if no argument is given and nothing is being piped in, list the current directory."
  if not set -q argv[1]; and isatty
    set argv[1] .
  end
  less $argv
end
