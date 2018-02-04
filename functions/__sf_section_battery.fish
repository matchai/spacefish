# Show section only if either of follow is true
# - Always show is true
# - battery percentage is below the given limit (default: 10%)
# - Battery is fully charged
function __sf_section_battery
	__sf_util_set_default SPACEFISH_BATTERY_SHOW true
	__sf_util_set_default SPACEFISH_BATTERY_PREFIX
	__sf_util_set_default SPACEFISH_BATTERY_SUFFIX
	__sf_util_set_default SPACEFISH_BATTERY_SYMBOL_CHARGING ⇡
	__sf_util_set_default SPACEFISH_BATTERY_SYMBOL_DISCHARGING ⇣
	__sf_util_set_default SPACEFISH_BATTERY_SYMBOL_FULL •
	__sf_util_set_default SPACEFISH_BATTERY_THRESHOLD 10

    # Check that user wants to show battery levels
	if not test $SPACEFISH_BATTERY_SHOW = true
	    return
	end

    set -l battery_data
    set -l battery_percent
    set -l battery_status
    set -l battery_color



end