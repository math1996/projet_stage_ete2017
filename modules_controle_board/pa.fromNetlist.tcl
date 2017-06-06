
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name modules_controle_board -dir "C:/Users/super/Desktop/projet_stage_ete2017/modules_controle_board/planAhead_run_1" -part xc6slx9tqg144-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/super/Desktop/projet_stage_ete2017/modules_controle_board/top_generation_onde.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/super/Desktop/projet_stage_ete2017/modules_controle_board} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top_generation_onde.ucf" [current_fileset -constrset]
add_files [list {top_generation_onde.ucf}] -fileset [get_property constrset [current_run]]
link_design
