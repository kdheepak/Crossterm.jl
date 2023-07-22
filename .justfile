generate:
  julia --project=scripts scripts/generator.jl
  julia -e 'using JuliaFormatter; format("./src/LibCrossterm.jl")'
