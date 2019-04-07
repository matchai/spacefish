#!/usr/bin/env fish
function test_speed
    fish -p trace_file -c "fish_prompt"
    printf "20 Slowest Lines of Code\nTime    Sum     Command\n\n"
    cat trace_file | sort -g | tail -n 20
    
    hyperfine --warmup 10 'fish -c "fish_prompt"'
end

printf "Test"
test_speed