FROM postgres:14.3

COPY scripts/ /docker-entrypoint-initdb.d/