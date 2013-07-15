#!/bin/bash

export KEY=$(cat key.txt 2> /dev/null)
export PAID_URL="http://media.railscasts.com/assets/subscriptions"
export FREE_URL="http://media.railscasts.com/assets/episodes/videos"

echo -e "\n"

if [[ -z $KEY ]]; then
  cat <<EOF
You had not provided any KEY.
To do that, put your API KEY in a key.txt file in this folder.
You will not be able do download PRO videos.
EOF
fi

# video format
if [[ -z $FORMAT ]]; then
  export FORMAT="mp4"
fi
cat <<EOF
Downloading the videos in ${FORMAT} format.
Avaliable formats are mp4, m4v, ogv and webm.
To change the used format, run the script as:

FORMAT="ogv" ${0}
EOF

# green echo
function green {
  echo -e "\033[0;32m${@}\033[0m"
}

# red echo
function red {
  echo -e "\033[0;31m${@}\033[0m"
}

function bold {
  echo -e "\033[1;30m${@}\033[0m"
}

echo -e "\n\n"
bold "-------------------------------"
echo -e "\n\n"

# Custom wget command, with continue and quiet options, as well path specification
function _wget {
  wget -c ${1} -P videos --quiet
}

# function which is responsible to download free eps
function download_free_ep {
  _wget "${FREE_URL}/${1}.${FORMAT}"
}

# function which is responsible to download paid/pro/etc eps
function download_paid_ep {
  _wget "${PAID_URL}/${KEY}/videos/${1}.${FORMAT}"
}

# treat erros, logging files which doesn't download to an errors.txt file
function error_treatment {
  if (( $? == 0 )); then
    green "---> 🍺  Successfully downloaded ${1}.${FORMAT}!"
  else
    red "---> 😭  Fail to download ${1}.${FORMAT} =("
    echo ${0} >> errors.txt
  fi
}

# try to download an Ep
function download_ep {
  download_free_ep ${1} || download_paid_ep ${1}
  error_treatment ${1}
}

# load eps from arguments if given.
function loadEps {
  if [[ -z "$@" ]]; then
    CAT=$(cat input.txt)
  else
    eps=$(printf " -e %s" "${@}")
    CAT="$(cat input.txt | grep -i${eps})"
  fi
  count=$(echo "${CAT}" | wc -l)
  export TOTAL=$(echo ${count} | sed -e 's/^[ \t]*//')
  export VIDEOS=${CAT}
}

# Main function
function main {
  bold "Downloading ${TOTAL} videos...\n\n"
  export INDEX=1
  for video in $VIDEOS; do
    bold "\n(${INDEX}/${TOTAL}) Downloading ${video}... \t"
    download_ep $video
    INDEX=$((${INDEX} + 1))
  done

  green "All done!"
}

# RUN FORREST RUN!
loadEps ${@}
main
