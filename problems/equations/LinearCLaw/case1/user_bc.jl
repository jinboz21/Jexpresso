"""
    qibdy is an Array{Floats} of size `nvars`

    src/equations/EQUATIONS_NAME/user_bc.jl contains a set of user-defined boundary conditions functions
    that can be modified as needed.

    The function defined in src/equations/EQUATIONS_NAME/user_bc.jl 
    are called by the b.c. functions defined in src/kernel/custom_bcs.jl
    within a boundary-edge loop that detects the "tag" string defined in the user-generated *.msh file.

    For example:
    If some domain boundaries of gmsh file mymesh.msh are tagged as "inflow" and "no_slip", then the user
    creating the functions in user_bc.jl must define the behavior of the unknown or its derivatives
    on those boundaries.

    ```math
    if (tag === "inflow")
        qibdy[1] = 3.0
    elseif (tag === "fix_temperature")
        qibdy[2] = 300.0
    end
    return qibdy
    ```
    where  `qibdy[i=1:nvar]` is the value unknown `i`
    
"""
function user_bc_dirichlet!(q::AbstractArray, gradq::AbstractArray, x::AbstractFloat, y::AbstractFloat, t::AbstractFloat, tag::String, qbdy::AbstractArray)
    c  = 1.0
    x0 = y0 = -0.8
    kx = ky = sqrt(2.0)/2.0
    ω  = 0.2
    d  = 0.5*ω/sqrt(log(2.0)); d2 = d*d
    e = exp(- ((kx*(x - x0) + ky*(y - y0)-c*t)^2)/d2) 
    #@info x,y,t,e
    qbdy[1] = e
    qbdy[2] = kx*e/c
    qbdy[3] = ky*e/c 
    return qbdy
end

#=function user_bc_dirichlet!(q::AbstractArray, gradq::AbstractArray, x::AbstractFloat, y::AbstractFloat, t::AbstractFloat, tag::String)
    c  = 1.0
    x0 = y0 = -0.8
    kx = ky = sqrt(2.0)/2.0
    ω  = 0.2
    d  = 0.5*ω/sqrt(log(2.0)); d2 = d*d
    e = exp(- ((kx*(x - x0) + ky*(y - y0)-c*t)^2)/d2)
    e_ref = exp(- ((-kx*(x - 2.8) + ky*(y - y0)-c*t)^2)/d2) 
    #@info x,y,t,e
    q[1] = min(e+e_ref,1)
    if (e > e_ref)
        q[2] = kx*e/c 
    else
        q[2] = -kx*e_ref/c 
    end
    q[3] = max(ky*e/c,ky*e_ref/c)
    
    return q
end=#

function user_bc_neumann(q::AbstractArray, gradq::AbstractArray, x::AbstractFloat, y::AbstractFloat, t::AbstractFloat, tag::String)
    flux = zeros(size(q,2),1)
    return flux
end
