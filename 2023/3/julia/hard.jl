data = readlines(joinpath(@__DIR__, "../input.txt"))

gear_ratio_sum = 0
for i in eachindex(data)
    for j in 1:length(data[i])
        point = data[i][j]

        # If the point is not an asterisk, we continue
        point != '*' ? continue : []

        # We get the coordinates of the digits around the asterisk
        digit_coordinates = []
        for a in filter(x -> 1 <= i + x <= length(data) ,-1:1)
            for b in filter(x -> 1 <= j + x <= length(data[i]),-1:1)
                !isdigit(data[i + a][j + b]) ? continue : []
                push!(digit_coordinates, (i + a, j + b))
            end
        end

        # We get the part numbers around the asterisk
        gear_numbers = []
        for coordinates in digit_coordinates
            line_number = coordinates[1]
            column_number = coordinates[2]

            line = data[line_number]
            start = findprev(x -> !isdigit(x), line, column_number)
            stop  = findnext(x -> !isdigit(x), line, column_number)
            start = isnothing(start) ? 1 : start + 1
            stop  = isnothing(stop) ? length(line) : stop - 1
            part_number = parse(Int, line[start:stop])
            push!(gear_numbers, part_number)
        end
        # We remove duplicates
        unique!(gear_numbers)
        # We add the gear ratio to the sum
        if length(gear_numbers) == 2
            global gear_ratio_sum += gear_numbers[1] * gear_numbers[2]
        end
    end
end
println(gear_ratio_sum)