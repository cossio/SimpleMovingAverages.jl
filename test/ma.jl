using Test: @test, @testset, @inferred
using Statistics: mean
using SimpleMovingAverages: moving_average

@testset "moving_average" begin
    for n in 1:10, m in 1:10
        @test length(moving_average(randn(n), m)) == n
    end
    x = randn(11)
    @test moving_average(x, length(x))[6] ≈ mean(x)
    @test moving_average(x, 3)[5] ≈ mean([x[4], x[5], x[6]])
    @test moving_average(x, 3)[1] ≈ mean([x[1], x[2]])
end
