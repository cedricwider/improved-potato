function client_secret
  argparse 'h/help' 'r/ruby' 'i/client_id' -- $argv

  if set --query _flag_help
    printf 'Usage: client_secret [OPTIONS]\n\n'
    printf 'Options:\n'
    printf '  -h/--help       Prints help and exits\n'
    printf '  -r/--ruby       Query for ruby-style secrets\n'
    printf '  -i/--client_id  Use client_id\n'
    return 0
  end


  if test (count $argv) -lt 1
    set -f client 'localsearch'
  else
    set -f client $argv[1]
  end
  kubectl get secrets $client -o json | jq '.data.auth_client_secret' | sed -e s/\"//g | base64 --decode
end
