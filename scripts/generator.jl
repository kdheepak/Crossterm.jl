using Clang.Generators
using libcrossterm_jll

cd(@__DIR__)

include_dir = normpath(libcrossterm_jll.artifact_dir, "include")

args = get_default_args()

push!(args, "-I$include_dir")
push!(args, "-fparse-all-comments")

options = load_options(joinpath(@__DIR__, "generator.toml"))

headers = detect_headers(include_dir, args)

ctx = create_context(headers, args, options)
build!(ctx)
