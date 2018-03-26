source $DIRNAME/spacefish_test_setup.fish
source $DIRNAME/mock.fish

function setup
	spacefish_test_setup
end

#
# pmset (Darwin and macOS)
#
test "Battery is greater than 10%"
	(
		mock pmset 0 "echo -e \"Now drawing from 'Battery Power'\n -InternalBattery-0 (id=4194403)\t95%; discharging; 4:50 remaining present: true\""
	) = (__sf_section_battery)
end

test "Battery is less than 10% (discharging)"
	(
		mock pmset 0 "echo -e \"Now drawing from 'Battery Power'\n -InternalBattery-0 (id=4194403)\t5%; discharging; 0:30 remaining present: true\""

		set_color --bold fff
		echo -n ""
		set_color normal
		set_color --bold red
		echo -n "⇣5%"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_battery)
end

test "Battery is less than 10% (charging)"
	(
		mock pmset 0 "echo -e \"Now drawing from 'Battery Power'\n -InternalBattery-0 (id=4194403)\t5%; discharging; 0:30 remaining present: true\""

		set_color --bold fff
		echo -n ""
		set_color normal
		set_color --bold red
		echo -n "⇡5%"
		set_color normal
		set_color --bold fff
		echo -n " "
		set_color normal
	) = (__sf_section_battery)
end
