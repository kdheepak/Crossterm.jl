generate:
  julia --project=scripts -e "using Pkg; Pkg.update()"
  julia --project=scripts scripts/generator.jl
  julia -e 'using JuliaFormatter; format("./src/LibCrossterm.jl")'
