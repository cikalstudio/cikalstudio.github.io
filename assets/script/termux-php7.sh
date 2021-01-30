cd && \
  echo -e "\n\e[1;32m update package \e[0m" && apt update && \
  echo -e "\n\e[1;32m install WGET and CURL \e[0m" && apt install wget curl && \
  echo -e "\n\e[1;32m prepair, download and install PHP \e[0m" && \
  wget https://github.com/cikaldev/termux-pod/raw/main/arm/php7/php_7.4.12_arm.deb && \
    apt install libgd libxslt libzip tidy && \
    dpkg -i php_7.4.12_arm.deb && \
  echo -e "\n\e[1;32m prepair, download and install PHP-FPM \e[0m" && \
  wget https://github.com/cikaldev/termux-pod/raw/main/arm/php7/php-fpm_7.4.12_arm.deb && \
    dpkg -i php-fpm_7.4.12_arm.deb && \
    echo -e "\n\e[1;32m setup FPM \e[0m" && \
    mkdir -p $PREFIX/var/run && php-fpm && \
  echo -e "\n\e[1;32m download and install PHP-PGSQL \e[0m" && \
  wget https://github.com/cikaldev/termux-pod/raw/main/arm/php7/php-pgsql_7.4.12_arm.deb && \
    dpkg -i php-pgsql_7.4.12_arm.deb && \
  echo -e "\n\e[1;32m install and setup NGINX \e[0m" && \
    apt install nginx && \
    mv $PREFIX/etc/nginx/nginx.conf $PREFIX/etc/nginx/nginx.conf.bak && \
    wget https://raw.githubusercontent.com/cikaldev/cikaldev.github.io/master/assets/script/nginx.conf -O $PREFIX/etc/nginx/nginx.conf && \
    nginx && sv-enable nginx && sv up nginx && \
  echo -e "\n\e[1;32m create symlink to main dir \e[0m" && \
    ln -s $PREFIX/share/nginx/html html && \
  wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip -O phpmyadmin.zip && \
    unzip phpmyadmin.zip && mv phpmyadmin ~/html/pma && \
  echo -e "\n\e[1;32m clear temp file \e[0m" && \
    rm php-pgsql_7.4.12_arm.deb && \
    rm php_7.4.12_arm.deb && \
    rm php-fpm_7.4.12_arm.deb && \
    rm phpmyadmin.zip && \
  echo -e "\n\e[1;32m create test file \e[0m" && echo '<?php phpinfo();?>' > ~/html/info.php && \
  xdg-open http://localhost:8080/info.php

echo "\n\ndone."
