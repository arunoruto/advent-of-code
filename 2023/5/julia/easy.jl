data = readlines(joinpath(@__DIR__, "../input.txt"))
seeds = parse.(Int, split(data[1][8:end]))
data = join(data[3:end], "\n")
data = split(data, "\n\n")
data = map(x -> split(x, "\n"), data)

elements = seeds

for i in eachindex(data)
    line = data[i]
    transformations = line[2:end]
    transformations = map(x -> parse.(Int, split(x)), transformations)

    for j in eachindex(elements)
        element = elements[j]
        for transformation in transformations
            if transformation[2] <= element < transformation[2] + transformation[3]
                elements[j] = transformation[1] + element - transformation[2]
                continue
            end
        end
    end
    

    # println(transformations)
end

println(elements)
println(min(elements...))
