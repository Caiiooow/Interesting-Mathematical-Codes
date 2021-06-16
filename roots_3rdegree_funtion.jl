### A Pluto.jl notebook ###
# v0.14.3

using Markdown
using InteractiveUtils

# ╔═╡ a216a140-c954-11eb-2f45-d307d01da88c
begin
	using Plots
	using Polynomials
end

# ╔═╡ d8e029a0-43b5-4b5c-af3a-b6c4c360e2e5
g(x) = x^3

# ╔═╡ 1da9b0e1-5269-4ccd-9612-2fc30b136330
pyplot()

# ╔═╡ 9ae62638-6af2-4de9-9357-4c57e4831d06
begin
	x = -10:0.1:10
	
	# Creating the polynomial 
	
	c = Polynomial([1, 3, 5]) # Coefficients
	r = fromroots([1, -4, 4]) # generating by roots
end

# ╔═╡ 0c0376ef-922e-4a2e-bfee-141915a83ada
begin
	plot(x, g, label = "Função do Terceiro Grau")
	plot!(zero, label = "Eixo x", color = "black", -20:20)
end

# ╔═╡ bc7708ba-ddf2-4da0-9f8d-13ea1c38ef6d
c(0) # zero of c

# ╔═╡ f1c331ff-6756-457b-a305-31c803f0aff3
r(0) # zero of r

# ╔═╡ a8306bd2-c5a0-47a3-87d8-bac3bbc63dc3
p = r + c

# ╔═╡ c40bd345-a27d-40ac-bab3-7e97fbbd08fb
p(0) # zero of this new polynomial

# ╔═╡ 41954b19-82b2-4a1a-9031-c1cf2b7101d2
begin
	t = Polynomial([1, 3, 5, 6])
	q = fromroots([1, 2, 3]) 
	p1 = t + q
end

# ╔═╡ 43b29e97-3fdd-40a7-85f6-ff29d037185d
xp1 = roots(p1)

# ╔═╡ 19125277-d2dc-4b36-bf32-5b096f1b58da
begin
	plot(x,p1.(x), c=:purple)
	plot!(zero, -10:10, c=:pink)
	
	scatter!(real(xp1), p1.(real(xp1)))
end

# ╔═╡ 1e6323db-dae8-4c23-9d98-d5ab5dcbf405
xr = real(x)

# ╔═╡ 892bc006-1053-4320-a36e-a417967f7acf
f(x) = 10*x^3 + b*x^2  + c*x + d

# ╔═╡ b2df63ec-9e23-4dec-81ce-5aa621e66db6
begin
	anim = @animate for i =0:0.1:2π
		b = -130*cos(Float64(i))
		c = 40*sin(Float64(i))
		d = 20*b - 30*c
		
		
		f(x) = 10*x^3 + b*x^2  + c*x + d
		
		p3 = Polynomial([d,c,b, 10])
		r3 = roots(p3)
		
		
		plot(x, f, 
		ylims=(-10000, 10000), 
		xlims=(-10, 10),
		c=:purple, 
		label = "Função do Terceiro Grau", 
		xlabel = "Eixo x",
		ylabel = "Eixo y", 
		title = "Animação da Função do Terceiro Grau", 
		grid = true)
		plot!(zero, -10:10, color =:pink, label = false)
		scatter!(real(r3), p3.(real(r3)), label = "Raizes")
	end
end

# ╔═╡ e5cca4b8-b637-41f2-986a-772f3321706d
gif(anim, "Third_Degree_Polynomial_fps10.gif", fps = 10)

# ╔═╡ d28cf9ef-244c-4c14-a7fa-3cf884e11518
gif(anim, "Third_Degree_Polynomial_fps15.gif", fps = 15)

# ╔═╡ 4e30040f-b9e2-466f-8a81-19d2616fb095
begin
	anim2 = @animate for i =0:0.1:2π
		b = -130*cos(Float64(i))
		c = 40*sin(Float64(i))
		d = 0
		
		
		f(x) = 10*x^3 + b*x^2  + c*x + d
		
		p3 = Polynomial([d,c,b, 10])
		r3 = roots(p3)
		
		
		plot(x, f, 
		ylims=(-10000, 10000), 
		xlims=(-10, 10),
		c=:purple, 
		label = "Função do Terceiro Grau", 
		xlabel = "Eixo x",
		ylabel = "Eixo y", 
		title = "Animação da Função do Terceiro Grau", 
		grid = true)
		plot!(zero, -10:10, color =:pink, label = false)
		scatter!(real(r3), p3.(real(r3)), label = "Raizes")
	end
end

# ╔═╡ 92e2575c-8bab-402f-97fb-50b0ca9d1e63
gif(anim2, "Teste_de_novo.gif", fps= 10)

# ╔═╡ Cell order:
# ╠═a216a140-c954-11eb-2f45-d307d01da88c
# ╠═d8e029a0-43b5-4b5c-af3a-b6c4c360e2e5
# ╠═1da9b0e1-5269-4ccd-9612-2fc30b136330
# ╠═0c0376ef-922e-4a2e-bfee-141915a83ada
# ╠═9ae62638-6af2-4de9-9357-4c57e4831d06
# ╠═bc7708ba-ddf2-4da0-9f8d-13ea1c38ef6d
# ╠═f1c331ff-6756-457b-a305-31c803f0aff3
# ╠═a8306bd2-c5a0-47a3-87d8-bac3bbc63dc3
# ╠═c40bd345-a27d-40ac-bab3-7e97fbbd08fb
# ╠═43b29e97-3fdd-40a7-85f6-ff29d037185d
# ╠═19125277-d2dc-4b36-bf32-5b096f1b58da
# ╠═41954b19-82b2-4a1a-9031-c1cf2b7101d2
# ╠═1e6323db-dae8-4c23-9d98-d5ab5dcbf405
# ╠═892bc006-1053-4320-a36e-a417967f7acf
# ╠═b2df63ec-9e23-4dec-81ce-5aa621e66db6
# ╠═e5cca4b8-b637-41f2-986a-772f3321706d
# ╠═d28cf9ef-244c-4c14-a7fa-3cf884e11518
# ╠═4e30040f-b9e2-466f-8a81-19d2616fb095
# ╠═92e2575c-8bab-402f-97fb-50b0ca9d1e63
