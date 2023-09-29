default:
  @just --list --justfile {{justfile()}}

generate:
  julia --project=scripts -e "using Pkg; Pkg.update()"
  julia --project=scripts scripts/generator.jl
  julia --project=scripts -e 'using JuliaFormatter; format("./src/LibCrossterm.jl")'
