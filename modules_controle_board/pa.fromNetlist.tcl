
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name modules_controle_board -dir "C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/planAhead_run_1" -part xc6slx9tqg144-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board/test_operation_matricielle.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/mathieu/Desktop/projet_stage_ete2017/modules_controle_board} {ipcore_dir} }
add_files [list {ipcore_dir/diviseur.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "test_operation_matricielle.ucf" [current_fileset -constrset]
add_files [list {test_operation_matricielle.ucf}] -fileset [get_property constrset [current_run]]
link_design
