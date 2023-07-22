using Crossterm
using Documenter

DocMeta.setdocmeta!(Crossterm, :DocTestSetup, :(using Crossterm); recursive = true)

makedocs(;
  modules = [Crossterm],
  authors = "Dheepak Krishnamurthy",
  repo = "https://github.com/kdheepak/Crossterm.jl/blob/{commit}{path}#{line}",
  sitename = "Crossterm.jl",
  format = Documenter.HTML(;
    prettyurls = get(ENV, "CI", "false") == "true",
    canonical = "https://kdheepak.com/Crossterm.jl",
    edit_link = "main",
    assets = String[],
  ),
  pages = ["Home" => "index.md"],
)

deploydocs(; repo = "github.com/kdheepak/Crossterm.jl", devbranch = "main")
