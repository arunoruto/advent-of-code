data = readlines(joinpath(@__DIR__, "../input1.txt"))
temp = parse.(Int, split(data[1][8:end]))
data = join(data[3:end], "\n")
data = split(data, "\n\n")
data = map(x -> split(x, "\n"), data)

seeds = []
for i in 1:2:length(temp)
    append!(seeds, collect(temp[i]:(temp[i]+temp[i+1]-1)))
end
println(seeds)

for i in eachindex(data)
    line = data[i]

    # println(line)
    transformations = line[2:end]
    transformations = map(x -> parse.(Int, split(x)), transformations)
    transformations = map(x -> [[x[1], x[1] + x[3] - 1], [x[2], x[2] + x[3] - 1]], transformations)

    for t in transformations
        println(t[1][1], " ... ", t[1][2], " -> ", t[2][1], " ... ", t[2][2])
    end
    println()
    

end



# println(elements)
# println(min(elements...))
