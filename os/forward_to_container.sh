#!/bin/bash

current_user=$USER

case "$current_user" in
  user-0)
    docker exec -it ddal-kkak-0 bash
    ;;
  user-1)
    docker exec -it ddal-kkak-1 bash
    ;;
  user-2)
    docker exec -it ddal-kkak-2 bash
    ;;
  user-3)
    docker exec -it ddal-kkak-3 bash
    ;;
  user-4)
    docker exec -it ddal-kkak-4 bash
    ;;
  user-5)
    docker exec -it ddal-kkak-5 bash
    ;;
  user-6)
    docker exec -it ddal-kkak-6 bash
    ;;
  user-7)
    docker exec -it ddal-kkak-7 bash
    ;;
  user-8)
    docker exec -it ddal-kkak-8 bash
    ;;
  user-9)
    docker exec -it ddal-kkak-9 bash
    ;;
  user-10)
    docker exec -it ddal-kkak-10 bash
    ;;
  ubuntu)
    exec /bin/bash
    ;;
  *)
    echo "Error: Unknown user"
    exit 1
    ;;
esac

# 컨테이너 exit 후 SSH 세션 종료
exit
