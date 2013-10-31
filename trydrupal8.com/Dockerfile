FROM nickgs/lemp

#build our site
ADD index.html /var/www/index.html
ADD style.css /var/www/style.css

EXPOSE 80

CMD service php5-fpm start && nginx
