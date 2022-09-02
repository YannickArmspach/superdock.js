#!/bin/bash

echo 'SUPERDOCK: autoload custom domain'

set -e

ME=$(basename $0)

auto_envsubst() {
  local template_dir="${NGINX_ENVSUBST_TEMPLATE_DIR:-/etc/nginx/templates}"
  local suffix="${NGINX_ENVSUBST_TEMPLATE_SUFFIX:-.template}"
  local output_dir="${NGINX_ENVSUBST_OUTPUT_DIR:-/etc/nginx/conf.d}"

  local template defined_envs relative_path output_path subdir
  defined_envs=$(printf '${%s} ' $(env | cut -d= -f1))
  [ -d "$template_dir" ] || return 0
  if [ ! -w "$output_dir" ]; then
    echo >&3 "$ME: ERROR: $template_dir exists, but $output_dir is not writable"
    return 0
  fi
  find "$template_dir" -follow -type f -name "*$suffix" -print | while read -r template; do
    relative_path="${template#$template_dir/}"
    output_path="$output_dir/${relative_path%$suffix}"
    subdir=$(dirname "$relative_path")
    # create a subdirectory where the template file exists
    mkdir -p "$output_dir/$subdir"
    
    if [ $template == "/etc/nginx/templates/host.1.conf.template" ]; then
      if [ -f "/etc/nginx/ssl/$NGINX_HOST_1/cert.crt" ]; then
        echo >&3 "$ME: Running envsubst on $template to $output_path"
        envsubst "$defined_envs" < "$template" > "$output_path"
      fi
    fi

    if [ $template == "/etc/nginx/templates/host.2.conf.template" ]; then
      if [ -f "/etc/nginx/ssl/$NGINX_HOST_2/cert.crt" ]; then
        echo >&3 "$ME: Running envsubst on $template to $output_path"
        envsubst "$defined_envs" < "$template" > "$output_path"
      fi
    fi

    if [ $template == "/etc/nginx/templates/host.3.conf.template" ]; then
      if [ -f "/etc/nginx/ssl/$NGINX_HOST_3/cert.crt" ]; then
        echo >&3 "$ME: Running envsubst on $template to $output_path"
        envsubst "$defined_envs" < "$template" > "$output_path"
      fi
    fi

    if [ $template == "/etc/nginx/templates/host.4.conf.template" ]; then
      if [ -f "/etc/nginx/ssl/$NGINX_HOST_4/cert.crt" ]; then
        echo >&3 "$ME: Running envsubst on $template to $output_path"
        envsubst "$defined_envs" < "$template" > "$output_path"
      fi
    fi

    if [ $template == "/etc/nginx/templates/host.5.conf.template" ]; then
      if [ -f "/etc/nginx/ssl/$NGINX_HOST_5/cert.crt" ]; then
        echo >&3 "$ME: Running envsubst on $template to $output_path"
        envsubst "$defined_envs" < "$template" > "$output_path"
      fi
    fi

    if [ $template == "/etc/nginx/templates/tool.adminer.conf.template" ]; then
      if [ -f "/etc/nginx/ssl_tools/adminer.superdock.dev/cert.crt" ]; then
        echo >&3 "$ME: Running envsubst on $template to $output_path"
        envsubst "$defined_envs" < "$template" > "$output_path"
      fi
    fi

    if [ $template == "/etc/nginx/templates/tool.mailhog.conf.template" ]; then
      if [ -f "/etc/nginx/ssl_tools/mailhog.superdock.dev/cert.crt" ]; then
        echo >&3 "$ME: Running envsubst on $template to $output_path"
        envsubst "$defined_envs" < "$template" > "$output_path"
      fi
    fi

    if [ $template == "/etc/nginx/templates/tool.rediscommander.conf.template" ]; then
      if [ -f "/etc/nginx/ssl_tools/rediscommander.superdock.dev/cert.crt" ]; then
        echo >&3 "$ME: Running envsubst on $template to $output_path"
        envsubst "$defined_envs" < "$template" > "$output_path"
      fi
    fi

  done
}

auto_envsubst

exit 0