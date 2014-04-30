FROM base/archlinux
MAINTAINER Alexander Jung-Loddenkemper <alexander@julo.ch>

RUN pacman -Syu --noconfirm --noprogressbar && rm -rf /var/cache/pacman/pkg/*
RUN pacman -S --noconfirm --noprogressbar mariadb && rm -rf /var/cache/pacman/pkg/*

VOLUME /var/lib/mysql

ADD secure.sql /secure.sql

RUN /usr/bin/mysqld_safe --datadir='/var/lib/mysql' --nowatch && sleep 5 && mysql < /secure.sql

EXPOSE 3306
CMD ["/usr/bin/mysqld_safe", "--datadir=/var/lib/mysql"]
