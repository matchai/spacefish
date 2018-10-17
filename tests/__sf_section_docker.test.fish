source $DIRNAME/spacefish_test_setup.fish
source $DIRNAME/mock.fish

function setup
    spacefish_test_setup
    mock docker 0 "echo \"18.06.1\""
end

function teardown
	if test -f Dockerfile
		rm Dockerfile
	end
	if test -f docker-compose.yml
		rm docker-compose.yml
	end
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

		set_color --bold fff
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v18.06.1"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Prints section when only docker-compose.yml is present"
	(
		touch docker-compose.yml

		set_color --bold fff
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v18.06.1"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Prints section when both Dockerfile and docker-compose.yml are present"
	(
		touch Dockerfile
		touch docker-compose.yml

		set_color --bold fff
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v18.06.1"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Prints Docker section when COMPOSE_FILE is set"
    (
		set -g COMPOSE_FILE /path/to/some.file

		set_color --bold fff
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v18.06.1"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Prints section when only Dockerfile is present with $DOCKER_MACHINE_NAME set"
	(
		touch Dockerfile
		set -g DOCKER_MACHINE_NAME some-machine-name

		set_color --bold fff
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v18.06.1 via $DOCKER_MACHINE_NAME"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Prints section when only docker-compose.yml is present with $DOCKER_MACHINE_NAME set"
	(
		touch docker-compose.yml
		set -g DOCKER_MACHINE_NAME some-machine-name

		set_color --bold fff
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v18.06.1 via $DOCKER_MACHINE_NAME"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Prints section when both Dockerfile and docker-compose.yml are present with $DOCKER_MACHINE_NAME set"
	(
		touch Dockerfile
		touch docker-compose.yml
		set -g DOCKER_MACHINE_NAME some-machine-name

		set_color --bold fff
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v18.06.1 via $DOCKER_MACHINE_NAME"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Prints Docker section when COMPOSE_FILE is set with $DOCKER_MACHINE_NAME set"
    (
		set -g COMPOSE_FILE /path/to/some.file
		set -g DOCKER_MACHINE_NAME some-machine-name

		set_color --bold fff
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v18.06.1 via $DOCKER_MACHINE_NAME"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Changing SPACEFISH_DOCKER_SYMBOL changes the displayed character"
	(
		set SPACEFISH_DOCKER_SYMBOL "· "
		touch Dockerfile

		set_color --bold fff
		echo -n "is "
		set_color normal
		set_color --bold cyan
		echo -n "· v18.06.1"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_docker)
end

test "Changing SPACEFISH_DOCKER_PREFIX changes the character prefix"
	(
		set sf_exit_code 0
		set SPACEFISH_DOCKER_PREFIX ·
		touch Dockerfile

		set_color --bold fff
		echo -n "·"
		set_color normal
		set_color --bold cyan
		echo -n "🐳 v18.06.1"
		set_color normal
		set_color --bold fff
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
		mock docker 127
	) = (__sf_section_docker)
end

# This case can be checked only by bringing down the docker deamon
test "Doesn't print section if docker deamon is not running"
    () = (__sf_section_docker)
end

test "Doesn't print section when not in a directory with Dockerfile or docker-compose.yml"
	() = (__sf_section_docker)
end
