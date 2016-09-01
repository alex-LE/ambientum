
# Versions

# Where the ambientum cache will live
set	A_CACHE_HOME		$HOME/.cache/ambientum

# Define specific cache directories
set	A_NPM_CACHE			$A_CACHE_HOME/npm
set	A_COMPOSER_CACHE	$A_CACHE_HOME/composer

# When using private projects, a SSH Key may be needed
# this line will provide your user ssh key
set A_SSH_HOME			$HOME/.ssh

###########################################
#### DO NOT EDIT BELOW THIS LINE UNLES    #
#### YOU KNOW WHAT YOU'RE DOING           #
###########################################

# Mount for SSH Directories
set	A_SSH_NODE_MOUNT	$A_SSH_HOME:/home/node-user/.ssh
set	A_SSH_PHP_MOUNT		$A_SSH_HOME:/home/php-user/.ssh

# Mount for cache
set	A_NPM_MOUNT			$A_NPM_CACHE:/home/node-user/.npm-packages
set	A_COMPOSER_MOUNT	$A_COMPOSER_CACHE:/home/php-user/.composer

# Create directories
mkdir -p $A_CACHE_HOME
mkdir -p $A_NPM_CACHE
mkdir -p $A_COMPOSER_CACHE

####
# Alias for NPM And other node commands
####

# Node
function node
	docker run -it --rm -v (pwd):/var/www/app -v $A_NPM_MOUNT -v $A_SSH_NODE_MOUNT ambientum/node:6 node $argv
end
#alias node=node

# NPM
function npm
	docker run -it --rm -v (pwd):/var/www/app -v $A_NPM_MOUNT -v $A_SSH_NODE_MOUNT ambientum/node:6 npm $argv
end
#alias npm=npm

# Gulp
function gulp
	docker run -it --rm -v (pwd):/var/www/app -v $A_NPM_MOUNT -v $A_SSH_NODE_MOUNT ambientum/gulp-cli:1.2 gulp $argv
end
#alias gulp=gulp

####
# Alias for Composer and other PHP commands
####

# PHP
function php
	docker run -it --rm -v (pwd):/var/www/app -v $A_COMPOSER_MOUNT -v $A_SSH_PHP_MOUNT ambientum/php:7.0 php $argv
end
#alias php=php


# Composer
function composer
	docker run -it --rm -v (pwd):/var/www/app -v $A_COMPOSER_MOUNT -v $A_SSH_PHP_MOUNT ambientum/php:7.0 composer $argv
end
#alias composer=composer