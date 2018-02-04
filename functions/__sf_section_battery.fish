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
    set -l battery_symbol

    # Darwin and macOS machines
    if test (type pmset | echo $status) -eq 0
        set battery_data (pmset -g batt)

        # Return if no internal battery
        if test -z (echo $battery_data | grep "InternalBattery")
            return
        end

        set battery_percent echo $battery_data | grep -oE '[0-9]{1,3}%'
        set battery_status
    # Linux machines
    else if test (type upower | echo $status) -eq 0
        return
    # Some Windows machines
    else if test (type acpi | echo $status) -eq 0
        return
    else
        return
    end

    if test $battery_percent -eq 100 -o -n string match "(charged|full)" $battery_status
        set battery_color green
    else if test $battery_percent -eq $SPACEFISH_BATTERY_THRESHOLD
        set battery_color red
    else
        set battery_color yellow
    end

    # echo -e -n -s (set_color $arrow_color) "$SPACEFISH_CHAR_PREFIX$SPACEFISH_CHAR_SYMBOL$SPACEFISH_CHAR_SUFFIX"

    # Battery indicator based on current status of battery
    if test $battery_status = "charging"
        set battery_symbol $SPACEFISH_BATTERY_SYMBOL_CHARGING
    else if test -n string match "^[dD]ischarg.*" $battery_status
        set battery_symbol $SPACEFISH_BATTERY_SYMBOL_DISCHARGING
    else
        set battery_symbol $SPACEFISH_BATTERY_SYMBOL_FULL
    end

end