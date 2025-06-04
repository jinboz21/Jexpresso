using LinearSolve: solve
using LinearAlgebra

function user_flux!(F::SubArray{Float64}, G::SubArray{Float64}, SD::NSD_2D,
    params,coef,connijk,iel,K,L,
    qe::SubArray{Float64},
    mesh::St_mesh,
    ::CL, ::TOTAL; 
    neqs=1, ip=1)   

    ω = params.ω
    ω1 = ω
    ψ = params.basis.ψ
    ψ1 = ψ
    dψ = params.basis.dψ
    dψ1 = dψ
    dξdx = params.metrics.dξdx
    dξdy = params.metrics.dξdy
    dηdx = params.metrics.dηdx
    dηdy = params.metrics.dηdy

    IP = connijk[iel,K,L]

    for j = 1:params.mesh.ngl
        for i = 1:params.mesh.ngl# which basis

            J = i + (j - 1)*(params.mesh.ngl)

            dψIJ_dx = dψ[i,K]*ψ1[j,L]*dξdx[iel,K,L] + ψ[i,K]*dψ1[j,L]*dηdx[iel,K,L]
            dψIJ_dy = dψ[i,K]*ψ1[j,L]*dξdy[iel,K,L] + ψ[i,K]*dψ1[j,L]*dηdy[iel,K,L]

            F[1] = F[1] .+ coef[J]*dψIJ_dy*(-params.uaux[IP])
            G[1] = G[1] .+ coef[J]*dψIJ_dx*(params.uaux[IP])
                
        end
    end


end
