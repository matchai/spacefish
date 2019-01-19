source $DIRNAME/spacefish_test_setup.fish
set -l LOCAL_DOCKER_VERSION 18.06.1

function setup
	spacefish_test_setup
	mock docker version 0 "echo \"18.06.1\""
	mkdir -p /tmp/tmp-spacefish
	cd /tmp/tmp-spacefish
end

function teardown
	rm -rf /tmp/tmp-spacefish
	if test "$COMPOSE_FILE"
		set -e COMPOSE_FILE
	end
	if test "$DOCKER_MACHINE_NAME"
		set -e DOCKER_MACHINE_NAME
	end
end

test "Prints section when only Dockerfile is present"
	(
		touch Dockerfile

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v$LOCAL_DOCKER_VERSION"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Prints section when only docker-compose.yml is present"
	(
		touch docker-compose.yml

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v$LOCAL_DOCKER_VERSION"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Prints section when both Dockerfile and docker-compose.yml are present"
	(
		touch Dockerfile
		touch docker-compose.yml

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v$LOCAL_DOCKER_VERSION"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Prints Docker section when COMPOSE_FILE is set and the $COMPOSE_FILE exists"
	(
		set -g COMPOSE_FILE /tmp/some-compose-file.yml
		touch /tmp/some-compose-file.yml

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v$LOCAL_DOCKER_VERSION"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Prints section when only Dockerfile is present with DOCKER_MACHINE_NAME set"
	(
		rm /tmp/some-compose-file.yml
		touch Dockerfile
		set -g DOCKER_MACHINE_NAME some-machine-name

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v$LOCAL_DOCKER_VERSION via $DOCKER_MACHINE_NAME"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Prints section when only docker-compose.yml is present with DOCKER_MACHINE_NAME set"
	(
		touch docker-compose.yml
		set -g DOCKER_MACHINE_NAME some-machine-name

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v$LOCAL_DOCKER_VERSION via $DOCKER_MACHINE_NAME"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Prints section when both Dockerfile and docker-compose.yml are present with DOCKER_MACHINE_NAME set"
	(
		touch Dockerfile
		touch docker-compose.yml
		set -g DOCKER_MACHINE_NAME some-machine-name

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v$LOCAL_DOCKER_VERSION via $DOCKER_MACHINE_NAME"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Prints Docker section when COMPOSE_FILE is set with DOCKER_MACHINE_NAME set"
		(
		set -g COMPOSE_FILE /tmp/some-compose-file.yml
		touch /tmp/some-compose-file.yml
		set -g DOCKER_MACHINE_NAME some-machine-name

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v$LOCAL_DOCKER_VERSION via $DOCKER_MACHINE_NAME"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Changing SPACEFISH_DOCKER_SYMBOL changes the displayed character"
	(
		rm /tmp/some-compose-file.yml
		set SPACEFISH_DOCKER_SYMBOL "· "
		touch Dockerfile

		set_color --bold
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "· v$LOCAL_DOCKER_VERSION"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Changing SPACEFISH_DOCKER_PREFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_DOCKER_PREFIX ·
		touch Dockerfile

		set_color --bold
		echo -n "·"
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v$LOCAL_DOCKER_VERSION"
		set_color normal
		set_color --bold
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end


# Negative
test "Doesn't display section when SPACEFISH_DOCKER_SHOW is set to 'false'"
	(
		set SPACEFISH_DOCKER_SHOW false
		touch Dockerfile

	) = (__sf_section_docker)
end

test "Doesn't print section if docker is not installed"
	(
		touch Dockerfile
		mock docker version 127
	) = (__sf_section_docker)
end

# This case can be checked only by bringing down the docker deamon
test "Doesn't print section if docker deamon is not running"
		() = (__sf_section_docker)
end

test "Doesn't print section when not in a directory with Dockerfile or docker-compose.yml"
	() = (__sf_section_docker)
end
