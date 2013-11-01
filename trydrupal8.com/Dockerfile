FROM nickgs/lemp

#build our site
ADD index.html /var/www/index.html
ADD style.css /var/www/style.css
ADD bars.png /var/www/bars.png
ADD bootstrap.min.js /var/www/bootstrap.min.js
ADD bootstrap.min.css /var/www/bootstrap.min.css

EXPOSE 80

CMD service php5-fpm start && nginx
