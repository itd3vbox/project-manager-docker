# Project Manager - Docker

This project requires Docker.

## Setup

**Add the following lines to your `/etc/hosts` file:**

```

127.0.0.1   projectmanager.demo
127.0.0.1   space.projectmanager.demo

```

Ensure that you have make installed on your system.

## Usage

Once you have make, you can build the project by running:

```

# Navigate to the project directory
cd project-docker/www-debian

# Build the project
make

```

Access the application:

After the build is complete, you can access the application at:
http://space.projectmanager.demo

## Cleaning Up

To clean up the project, run:

```

make clean

```