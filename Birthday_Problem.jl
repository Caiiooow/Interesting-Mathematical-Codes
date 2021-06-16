### A Pluto.jl notebook ###
# v0.14.3

using Markdown
using InteractiveUtils

# ╔═╡ 5aad7a4c-a7d9-4b08-9653-2a51e756b218
begin
	using StatsBase
	using Plots; pyplot()
	using Combinatorics
	
end

# ╔═╡ b0c17cc0-cd45-11eb-39d2-7d5b1ec7f3d5
md"""
This code is made out to perform simulations of the Birthday Problem, here we shall go through more than one computational solution to this interesting probability problem
"""

# ╔═╡ e155b190-e883-4b7b-ab02-32db487363d9
md"""
First Solution:
"""

# ╔═╡ 2f09ae3f-367e-4db6-8519-6bda6270815d
begin
	matchExists1(n) = 1 - prod([k/365 for k in 365:-1:365-n+1])
	matchExists2(n) = 1- factorial(365,365-big(n))/365^big(n)
	
end

# ╔═╡ 050f32c6-9bba-43e9-a893-abfcd751e6c6
#birthdayEvents(n) simulates a room full of n people, and if at least two people share a birthday, returns true

function birthdayEvents(n)
	birthdays = rand(1:365, n) # Creates the array birthdays of length n and assigns an integer in the range
	
	daycounts = counts(birthdays, 1:365)
	
	return maximum(daycounts) > 1
	
end

# ╔═╡ 4632676a-1a33-4b89-a17e-27c551880cb0
x = 1:50

# ╔═╡ 4eca5bed-6460-41e2-b5ff-4a7f38d7fa25
begin
	analyticSol1 = [matchExists1(n) for n in x]
	analyticSol2 = [matchExists2(n) for n in x]
end

# ╔═╡ d3830ea9-60c2-4e27-add3-d1a62119d8b9
Maxerror = "Maximum error: $(maximum(abs.(analyticSol1 - analyticSol2)))"

# ╔═╡ fdc1a273-c3b7-4196-8365-2220c245b520
N = 10^5

# ╔═╡ b4317030-2a94-460d-b797-ee30fe17a5db
probEst(n) = sum([birthdayEvents(n) for α in 1:N])/N


# ╔═╡ b6f71376-23bb-4c1c-ab02-f90c8353b0c4
MontCarlEstim = [probEst(n) for n in x]

# ╔═╡ d1ad18f7-7fc4-412d-b75c-71dde7a64672
begin
	plot(x, analyticSol1, c=:pink, label = "Solução Analitica")
	
	scatter!(x, MontCarlEstim, c=:purple, 
			label = "Estimativa", 
			xlims=(0,50), 
			ylims=(0, 1),
			legend =:topleft)
end

# ╔═╡ ccd457f4-60f3-4e25-9a01-4d21d254574b
savefig("Birthday_Problem.png")

# ╔═╡ 9600d36a-2942-426c-be7a-4d447797d705
birthdayEvents(23)

# ╔═╡ af8773d1-fa30-4891-acd2-99f318bf3ed4
probEst(23) 


# ╔═╡ Cell order:
# ╟─b0c17cc0-cd45-11eb-39d2-7d5b1ec7f3d5
# ╠═5aad7a4c-a7d9-4b08-9653-2a51e756b218
# ╟─e155b190-e883-4b7b-ab02-32db487363d9
# ╠═2f09ae3f-367e-4db6-8519-6bda6270815d
# ╠═050f32c6-9bba-43e9-a893-abfcd751e6c6
# ╠═4632676a-1a33-4b89-a17e-27c551880cb0
# ╠═b4317030-2a94-460d-b797-ee30fe17a5db
# ╠═4eca5bed-6460-41e2-b5ff-4a7f38d7fa25
# ╠═d3830ea9-60c2-4e27-add3-d1a62119d8b9
# ╠═fdc1a273-c3b7-4196-8365-2220c245b520
# ╠═b6f71376-23bb-4c1c-ab02-f90c8353b0c4
# ╠═d1ad18f7-7fc4-412d-b75c-71dde7a64672
# ╠═ccd457f4-60f3-4e25-9a01-4d21d254574b
# ╠═9600d36a-2942-426c-be7a-4d447797d705
# ╠═af8773d1-fa30-4891-acd2-99f318bf3ed4
