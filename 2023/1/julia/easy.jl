data = readlines(joinpath(@__DIR__, "../input.txt"))

result = 0
for d in data
    p = split(d, "")
    p = map(x -> only(x), p)
    filter!(x -> isdigit(only(x)), p)
    p = parse.(Int, p)
    global result += 10 * p[1] + p[end]
end

println(result)