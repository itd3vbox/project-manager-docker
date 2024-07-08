# DOCKER - WWW

- "1000:1000" corresponds to the UID and GID of the user on your host system. You can replace these values with those of your user on your host system.

```
id -u
id -g
```

### Build

- **Step 1 :** Download the following projects:
  - [project-manager-laravel](https://github.com/itd3vbox/project-manager-laravel)
  - [project-manager-next](https://github.com/itd3vbox/project-manager-next)

- **Step 2 :** Modify the .env file and adjust the following variables:
  - PM_LARAVEL and PM_NEXT to match the locations of the downloaded projects (use absolute paths or run pwd to get the current path).

- **Step 3 :** Add the following line to your /etc/hosts file:

```
127.0.0.1   projectmanager.demo

```

- **Step 4 :** Install Docker, then run the make command.

- **Step 5 :** In the "Containers" section of Docker, select the container named 'www-web', then choose the 'Exec' tab. Once started, run the following commands:

```
bash
cd /var/www/project-manager-laravel/
composer install
``` 

- **Step 6 :** Once the Docker containers are running, go to http://projectmanager.demo/ in your browser to see the running application.


### Commands

```
php -i
php -i | grep 'Loaded Configuration File'
php -i | grep 'upload_max_filesize'
php -i | grep 'post_max_size'

nginx -T | grep client_max_body_size

```