#
# Amazon Web Services (AWS)
#
# The AWS Command Line Interface (CLI) is a unified tool to manage AWS services.
# Link: https://aws.amazon.com/cli/

function __sf_section_aws -d "Display the selected aws profile"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_AWS_SHOW true
	__sf_util_set_default SPACEFISH_AWS_PREFIX "using "
	__sf_util_set_default SPACEFISH_AWS_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	__sf_util_set_default SPACEFISH_AWS_SYMBOL "☁️ "
	__sf_util_set_default SPACEFISH_AWS_COLOR ff8700

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# Show the selected AWS-cli profile
	[ $SPACEFISH_AWS_SHOW = false ]; and return

	# Ensure the aws command is available
	type -q aws; or return

	# Early return if there's no AWS_PROFILE, or it's set to default
	if test -z "$AWS_PROFILE" \
		-o "$AWS_PROFILE" = "default"
		return
	end

	__sf_lib_section \
		$SPACEFISH_AWS_COLOR \
		$SPACEFISH_AWS_PREFIX \
		"$SPACEFISH_AWS_SYMBOL""$AWS_PROFILE" \
		$SPACEFISH_AWS_SUFFIX
end
