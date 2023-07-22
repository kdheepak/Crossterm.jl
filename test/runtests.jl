import Crossterm as C
using Test

@testset "Crossterm.jl" begin
  @testset "last_error_message" begin
    @test C.last_error_message() == "No error message found. Check library documentation for more information."
  end

  @testset "clear_last_error" begin
    C.clear_last_error()
    @test C.last_error_message() == "No error message found. Check library documentation for more information."
  end
end
