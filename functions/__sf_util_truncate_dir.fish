function __sf_util_truncate_dir -d "Truncate a directory path" -a path truncate_to
    if test $truncate_to -eq 0
        echo $path
    else
        set -l folders (string split / $path)
        
        if test (count $folders) -le $truncate_to
            echo $path
        else
            echo (string join / $folders[(math 0 - $truncate_to)..-1])
        end
    end        
end