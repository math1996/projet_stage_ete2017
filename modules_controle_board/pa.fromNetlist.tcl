
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name modules_controle_board -dir "C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/planAhead_run_1" -part xc6slx9tqg144-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/test_diviseur_clk_precision.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board} {ipcore_dir} }
add_files [list {ipcore_dir/diviseur.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "test_diviseur_clk_precision.ucf" [current_fileset -constrset]
add_files [list {test_diviseur_clk_precision.ucf}] -fileset [get_property constrset [current_run]]
link_design
