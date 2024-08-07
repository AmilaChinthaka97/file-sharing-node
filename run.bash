 #! /bin/bash

    config="services:"
    for i in {1..20}
      do
        export SERVICE_NAME="apache${i}"
        export PORT=$((3000 + i))
        config="${config}
    $(envsubst < docker-compose.template.yml)"
    done

    echo "${config}" | docker-compose -f - "$@"