# Use PHP with Apache as the base image
FROM ubuntu

# Install Additional System Dependencies
RUN apt-get update && apt-get install apache2 -y 

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Enable Apache mod_rewrite for URL rewriting
RUN a2enmod rewrite

# Configure Apache DocumentRoot to point to Laravel's public directory
# and update Apache configuration files
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Copy the application code
COPY . /var/www/html

# Set the working directory
WORKDIR /var/www/html
RUN rm -rf index.html

# Install PHP extensions
# RUN docker-php-ext-install pdo_mysql zip gd

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install project dependencies
# RUN composer global require laravel/installer --update-with-all-dependencies

# RUN php artisan key:generate
# RUN php artisan cache:clear
# RUN php artisan config:clear
# RUN php artisan config:cache
# RUN php artisan optimize:clear
# RUN php artisan route:clear
# RUN php artisan view:clear

# # Set permissions
# RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache


# 7.3 & 7.1

docker run -d -p 8080:80 -p 3306:3306 ubuntu/apache2:latest
docker run -d -p 3000:3000 -p 1936:1936 -p 3445:3445 --name my_ubuntu ubuntu/apache2:latest