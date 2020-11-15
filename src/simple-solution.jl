### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ 109eea2e-26fe-11eb-00ae-d7254595bdcb
using Metaheuristics

# ╔═╡ ff239f20-2704-11eb-3030-adbea02e6595
md"Upper Level Function"

# ╔═╡ 46adf680-26fe-11eb-3394-dbc4c253a1e1
F(x, y) = sum( x.^2 + y.^2 );

# ╔═╡ 2888b86e-2705-11eb-199a-d7c5cadbc910
md"Lower Level Function"

# ╔═╡ 4703056c-26fe-11eb-1d9e-17eda2f86f3c
f(x,y) = sum( (x - y).^2 );

# ╔═╡ 470c8bc8-26fe-11eb-2bc1-e9ae54af88ce
bounds = [ -5 -5 -5; 5 5 5.0 ]

# ╔═╡ d37b6f2e-2704-11eb-2cec-9538ef950d0e
desired_accuracy = 1e-5

# ╔═╡ 75fcce7c-2701-11eb-1cb2-3bb17b37488b
begin
	o = Options(f_tol=desired_accuracy, f_calls_limit=1000);
	i = Information(f_optimum=0.0);
	method = ECA(options=o, information=i);
end;

# ╔═╡ 470e3fd6-26fe-11eb-21f5-050391ee04a6
Ψ(x) = minimizer( optimize( y -> f(x, y), bounds, ECA(information=i, options=o))  )

# ╔═╡ 47218258-26fe-11eb-3046-1f72fb0dafb5
res = optimize( x->F(x, Ψ(x)), bounds,method );

# ╔═╡ 4f6db010-2705-11eb-3093-b1b0a6b5453c
md"Solution found in $(round(res.overall_time, digits=2)) seconds."

# ╔═╡ 8a053d02-2704-11eb-0b3c-b187953a1d1a
minimizer(res)

# ╔═╡ 962fa6e4-2704-11eb-0836-2f2b0cda7708
minimum(res)

# ╔═╡ Cell order:
# ╠═109eea2e-26fe-11eb-00ae-d7254595bdcb
# ╟─ff239f20-2704-11eb-3030-adbea02e6595
# ╠═46adf680-26fe-11eb-3394-dbc4c253a1e1
# ╟─2888b86e-2705-11eb-199a-d7c5cadbc910
# ╠═4703056c-26fe-11eb-1d9e-17eda2f86f3c
# ╠═470c8bc8-26fe-11eb-2bc1-e9ae54af88ce
# ╠═470e3fd6-26fe-11eb-21f5-050391ee04a6
# ╠═d37b6f2e-2704-11eb-2cec-9538ef950d0e
# ╠═47218258-26fe-11eb-3046-1f72fb0dafb5
# ╟─4f6db010-2705-11eb-3093-b1b0a6b5453c
# ╠═8a053d02-2704-11eb-0b3c-b187953a1d1a
# ╠═962fa6e4-2704-11eb-0836-2f2b0cda7708
# ╟─75fcce7c-2701-11eb-1cb2-3bb17b37488b
