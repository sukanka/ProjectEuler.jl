using ProjectEuler
using Test
cd("src")
@testset "ProjectEuler.jl" begin
    @test solution1() == 233168
    @test solution2() == 4613732
    @test solution3() == 6857
    @test solution4() == 906609
    @test solution5() == 232792560
    @test solution6() == 25164150
    @test solution7() == 104743
    @test solution8() == 23514624000
    @test solution9() == 31875000
    @test solution10() == 142913828922
    @test solution11() == 70600674
    @test solution12() == 76576500
    @test solution13() == 5537376230
    @test solution14() == 837799
    @test solution15() == 137846528820
    @test solution16() == 1366
    @test solution17() == 21124
    @test solution18() == 1074
    @test solution19() == 171
    @test solution20() == 648
    @test solution21() == 31626
    @test solution22() == 871198282
    @test solution23() == 4179871
    @test solution24() == 2783915460
    @test solution25() == 4782
    @test solution26() == 983
    @test solution27() == -59231
    @test solution28() == 669171001
    @test solution29() == 9183
    @test solution30() == 443839
    @test solution31() == 73682
    @test solution32() == 45228
    @test solution33() == 100
    @test solution34() == 40730
    @test solution35() == 55
    @test solution36() == 872187
    @test solution37() == 748317
end



