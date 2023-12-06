data = readlines(joinpath(@__DIR__, "../input.txt"))
seeds = parse.(Int, split(data[1][8:end]))
data = join(data[3:end], "\n")
data = split(data, "\n\n")
data = map(x -> split(x, "\n"), data)

minimal = Inf
for i in 1:2:length(seeds)
    println(200 * i / length(seeds))
    elements = seeds[i]:(seeds[i] + seeds[i+1] - 1)
    for i in eachindex(data)
        line = data[i]
        println(line)
        # transformations = line[2:end]
        # transformations = map(x -> parse.(Int, split(x)), transformations)
    
        # for j in eachindex(elements)
        #     element = elements[j]
        #     for transformation in transformations
        #         if transformation[2] <= element < transformation[2] + transformation[3]
        #             elements[j] = transformation[1] + element - transformation[2]
        #             continue
        #         end
        #     end
        # end
        
    
    end
    global minimal = min(minimal, minimum(elements...))
end
# elements = seeds



# println(elements)
# println(min(elements...))
