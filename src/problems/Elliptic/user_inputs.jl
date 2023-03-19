function user_inputs()
    inputs = Dict(
        #---------------------------------------------------------------------------
        #
        # User define your inputs below: the order doesn't matter
        # IMPORTANT NOTICE: DO NOT FORGET the "," at the end of each entry!!!
        #---------------------------------------------------------------------------
        #---------------------------------------------------------------------------
        #Integration and quadrature properties
        #---------------------------------------------------------------------------
        #:ode_solver          => "BICGSTABLE",
        :ode_solver          => "GMRES",
        :interpolation_nodes => "lgl", # Choice: "lgl", "cg", "cgl"
        :nop                 => 4,     # Polynomial order
        :lexact_integration  => false,
        #:output_dir          => "/Users/simone/runs/",
        #---------------------------------------------------------------------------
        # Physical parameters/constants:
        #---------------------------------------------------------------------------
        #:νx                   => 0.01, #kinematic viscosity constant
        #:νy                   => 0.01, #kinematic viscosity constant
        #---------------------------------------------------------------------------
        # Mesh paramters and files:
        #---------------------------------------------------------------------------
        :lread_gmsh          => true, #If false, a 1D problem will be enforced
        #:gmsh_filename       => "./meshes/gmsh_grids/2d-grid.msh",
        :gmsh_filename       => "./meshes/gmsh_grids/circle_TFI.msh",
        #:gmsh_filename       => "./meshes/gmsh_grids/hexa_TFI_2x2.msh",
        #:gmsh_filename       => "./meshes/gmsh_grids/circle.msh",
        #:gmsh_filename       => "./meshes/gmsh_grids/hexa_TFI_10x10.msh",
        #:gmsh_filename       => "./meshes/gmsh_grids/hexa_TFI_25x25.msh",
        #---------------------------------------------------------------------------
        # Output formats: "png" -> plots to png file. "ascii" -> data to npoin file
        #---------------------------------------------------------------------------
        :outformat     => "png", #choice: "png", "ascii"
        #---------------------------------------------------------------------------
        # 1D (lread_gmsh => faluse): the grid is built by jexpresso
        #---------------------------------------------------------------------------
        :xmin          =>   0.0,
        :xmax          =>   1.0,
        :nelx          =>   25,
        #---------------------------------------------------------------------------
        # Boundary conditions:
        #---------------------------------------------------------------------------
        :xmin_bc       => "periodic", #Use either "dirichlet" or "periodic"
        :ymin_bc       => "periodic", #Use either "dirichlet" or "periodic"
        :zmin_bc       => "periodic", #Use either "dirichlet" or "periodic"
        :xmax_bc       => "periodic", #Use either "dirichlet" or "periodic"
        :ymax_bc       => "periodic", #Use either "dirichlet" or "periodic"
        :zmax_bc       => "periodic", #Use either "dirichlet" or "periodic"
        :bc_exact_xmin => [0.0 0.0 0.0],
        :bc_exact_xmax => [0.0 0.0 0.0],
        :bc_exact_ymin => [0.0 0.0 0.0],
        :bc_exact_ymax => [0.0 0.0 0.0],
        :bc_exact_zmin => [0.0 0.0 0.0],
        :bc_exact_zmax => [0.0 0.0 0.0],
        
    ) #Dict
    #---------------------------------------------------------------------------
    # END User define your inputs below: the order doesn't matter
    #---------------------------------------------------------------------------

    return inputs
    
end
