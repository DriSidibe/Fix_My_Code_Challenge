###
#
#  Sort integer arguments (ascending) 
#
###

result = []
tmp_res = []
ARGV.each do |arg|
    # skip if not integer
    next if arg !~ /^-?[0-9]+$/

    # convert to integer
    i_arg = arg.to_i
    
    # insert result at the right position
    is_inserted = false
    i = 0
    l = result.size
    while !is_inserted && i < l do
        if result[i] < i_arg
            i += 1
        else
            if i == 0
                tmp_res << i_arg
                for j in result
                  tmp_res << j
                end
            else
              for k in 0..i-1
                tmp_res << result[k]
              end
              tmp_res << i_arg
              for k in i..l-1
                tmp_res << result[k]
              end
            end
            result.clear()
            for m in tmp_res
              result << m
            end
            tmp_res.clear()
            is_inserted = true
            break
        end
    end
    result << i_arg if !is_inserted
end

puts result
