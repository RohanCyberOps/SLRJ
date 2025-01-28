# Import required libraries
using Plots
using Statistics

# Step 1: Generate synthetic data
function generate_data(n::Int)
    # Independent variable
    x = 1:n
    # Dependent variable with some random noise
    y = 3.5 .* x .+ 10 .+ randn(n) .* 10
    return x, y
end

# Step 2: Perform Linear Regression
function linear_regression(x::Vector{Float64}, y::Vector{Float64})
    n = length(x)
    x_mean = mean(x)
    y_mean = mean(y)

    # Compute slope (m) and intercept (b)
    m = sum((x .- x_mean) .* (y .- y_mean)) / sum((x .- x_mean).^2)
    b = y_mean - m * x_mean

    return m, b
end

# Step 3: Plot results
function plot_regression(x::Vector{Float64}, y::Vector{Float64}, m::Float64, b::Float64)
    scatter(x, y, label="Data Points", legend=:top, title="Simple Linear Regression", xlabel="x", ylabel="y")
    plot!(x, m .* x .+ b, label="Regression Line", lw=2, color=:red)
end

# Main Function
function main()
    # Generate data
    n = 100
    x, y = generate_data(n)
    x = Float64.(x)  # Ensure x is Float64 for calculations

    # Perform regression
    m, b = linear_regression(x, y)

    # Display results
    println("Linear Regression Equation: y = $(round(m, digits=2))x + $(round(b, digits=2))")

    # Plot regression
    plot_regression(x, y, m, b)
end

# Run the project
main()
