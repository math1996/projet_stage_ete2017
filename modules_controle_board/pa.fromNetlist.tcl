
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name modules_controle_board -dir "C:/Users/super/Desktop/projet_stage_ete2017/modules_controle_board/planAhead_run_2" -part xc6slx9tqg144-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/super/Desktop/projet_stage_ete2017/modules_controle_board/test_serial_tx.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/super/Desktop/projet_stage_ete2017/modules_controle_board} }
set_property target_constrs_file "test_serial_tx.ucf" [current_fileset -constrset]
add_files [list {test_serial_tx.ucf}] -fileset [get_property constrset [current_run]]
link_design
