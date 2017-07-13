# Descartes script translated by migration_assistant Version: 2.5.8 (Build Date: Apr 28, 2017)
# Supported DC version: DC L-2016.03
# Supported Descartes version: 2.5.8

# Note:
# This section has information on DC compatible procedures.
# Please note that sourcing these procs will enable a
# Design Compiler compatibility mode. In this mode, settings
# of certain variables and certain tool attributes may be
# altered from their defaults.
#
# A few examples are  listed below.
#    set sh_continue_on_error true
#    set_app_options -global -name design.include_physical_only_objects -value false
#
# Please refer TCL files in the DC2DCRT_UTIL_PATH path for more details.
# If you are in Descartes shell, you may run the proc
# MA_print_dc_compatibility_mode for details.

# Source special procedures provided for Descartes migration
if {[lsearch [array names env] "DC2DCRT_UTIL_PATH"] >= 0} {
    set DC2DCRT_UTIL_PATH $env(DC2DCRT_UTIL_PATH)
} elseif {$synopsys_program_name == "dcrt_shell"} {
    set DC2DCRT_UTIL_PATH ${synopsys_root}/auxx/ma/tcl
} else {
    set DC2DCRT_UTIL_PATH "/u/dcntmgr/spf_main_dcnt/image_NIGHTLY/latest/auxx/ma/tcl"
}
source ${DC2DCRT_UTIL_PATH}/dcrt_util.tcl

##PRS-MVDST-STR: move from dc.tcl to setup.tcl

### NSGK feedback from consistency checker : same setting as ICC2
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable case_analysis_propagate_through_icg is translated to application option time.case_analysis_propagate_through_icg. (MA-074)
set_app_options -as_user_default -name time.case_analysis_propagate_through_icg -value true
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable timing_clock_gating_propagate_enable is translated to application option time.clock_gating_propagate_enable. (MA-074)
set_app_options -as_user_default -name time.clock_gating_propagate_enable -value true
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable enable_clock_to_data_analysis is translated to application option time.enable_clock_to_data_analysis. (MA-074)
set_app_options -as_user_default -name time.enable_clock_to_data_analysis -value true
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable timing_edge_specific_source_latency is translated to application option time.edge_specific_source_latency. (MA-074)
set_app_options -as_user_default -name time.edge_specific_source_latency -value true
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable timing_enable_non_sequential_checks is translated to application option time.enable_non_sequential_checks. (MA-074)
set_app_options -as_user_default -name time.enable_non_sequential_checks -value true
## MA ERROR : Variable rc_degrade_min_slew_when_rd_less_than_rnet is disabled because it is not supported. (MA-272)
# set rc_degrade_min_slew_when_rd_less_than_rnet true

## set dc_shell parameter ##
## MA ERROR : Variable cache_read is disabled because it is not supported. (MA-272)
# set cache_read "./.synopsys_cache"
## MA ERROR : Variable cache_write is disabled because it is not supported. (MA-272)
# set cache_write "./.synopsys_cache"
## MA ERROR : Variable alib_library_analysis_path is disabled because it is not supported. (MA-272)
# set alib_library_analysis_path "./.alib_cache"
## MA ERROR : Variable verilogout_no_tri is disabled because it is not supported. (MA-272)
# set verilogout_no_tri true
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable bus_naming_style is translated to application option design.bus_delimiters. (MA-074)
## MA  INFO : Variable value %s\[%d\] is translated to []. (MA-071)
set_app_options -as_user_default -name design.bus_delimiters -value {[]}
## MA ERROR : Variable bus_inference_style is disabled because it is not supported. (MA-272)
# set bus_inference_style "%s\[%d\]"
## MA ERROR : Variable hdlout_internal_busses is disabled because it is not supported. (MA-272)
# set hdlout_internal_busses true
## MA ERROR : Variable verilogout_show_unconnected_pins is disabled because it is not supported. (MA-272)
# set verilogout_show_unconnected_pins true
## MA ERROR : Variable verilogout_higher_designs_first is disabled because it is not supported. (MA-272)
# set verilogout_higher_designs_first true
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable hdlin_mux_size_limit is translated to application option hdlin.elaborate.mux_size_limit. (MA-074)
##PRS-RM-1-STR: this application option is removed from DCRT UI.
# set_app_options -as_user_default -name hdlin.elaborate.mux_size_limit -value 256
##PRS-RM-1-END: this application option is removed from DCRT UI.
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable hdlin_latch_always_async_set_reset is translated to application option hdlin.elaborate.latch_infer_async_set_reset. (MA-074)
##PRS-ADD-2-STR: dcrt-only application options.
# set_app_options -as_user_default -name hdlin.elaborate.latch_infer_async_set_reset -value true
##PRS-ADD-2-SPLT: dcrt-only application options.
if {$synopsys_program_name == "dcrt_shell"} {
    set_app_options -as_user_default -name hdlin.elaborate.latch_infer_async_set_reset -value true
}
##PRS-ADD-2-END: dcrt-only application options.
## MA ERROR : Variable timing_enable_multiple_clocks_per_reg is disabled because it is not supported. (MA-272)
# set timing_enable_multiple_clocks_per_reg true
## MA ERROR : Variable compile_disable_hierarchical_inverter_opt is disabled because it is not supported. (MA-272)
# set compile_disable_hierarchical_inverter_opt true
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable compile_enable_register_merging is translated to application option compile.seqmap.enable_register_merging. (MA-074)
##PRS-ADD-3-STR: dcrt-only application options.
# set_app_options -as_user_default -name compile.seqmap.enable_register_merging -value false
##PRS-ADD-3-SPLT: dcrt-only application options.
if {$synopsys_program_name == "dcrt_shell"} {
    set_app_options -as_user_default -name compile.seqmap.enable_register_merging -value false
}
##PRS-ADD-3-END: dcrt-only application options.
## MA ERROR : Variable compile_clock_gating_through_hierarchy is disabled because it is not supported. (MA-272)
# set compile_clock_gating_through_hierarchy true
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable hdlin_vrlg_std is translated to application option hdlin.verilog.standard. (MA-074)
##PRS-ADD-4-STR: dcrt-only application options.
# set_app_options -as_user_default -name hdlin.verilog.standard -value 2001
##PRS-ADD-4-SPLT: dcrt-only application options.
if {$synopsys_program_name == "dcrt_shell"} {
    set_app_options -as_user_default -name hdlin.verilog.standard -value 2001
}
##PRS-ADD-5-END: dcrt-only application options.
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable hdlin_preserve_sequential is translated to application option hdlin.elaborate.preserve_sequential. (MA-074)
##PRS-ADD-5-STR: dcrt-only application options.
# set_app_options -as_user_default -name hdlin.elaborate.preserve_sequential -value true
##PRS-ADD-5-SPLT: dcrt-only application options.
if {$synopsys_program_name == "dcrt_shell"} {
    set_app_options -as_user_default -name hdlin.elaborate.preserve_sequential -value true
}
##PRS-ADD-1-END: dcrt-only application options.
## MA ERROR : Variable compile_timing_high_effort is disabled because it is not supported. (MA-272)
# set compile_timing_high_effort true
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Both constant and unloaded logic is propagated in Descartes when boundary optimization is globally disabled. Please use set_boundary_optimization command to selectively control boundary optimization on a specific object. (MA-647)
## MA  INFO : Variable compile_enable_constant_propagation_with_no_boundary_opt is translated to application option compile.optimization.constant_and_unloaded_propagation_with_no_boundary_optimization. (MA-074)
##PRS-ADD-6-STR: dcrt-only application options.
# set_app_options -as_user_default -name compile.optimization.constant_and_unloaded_propagation_with_no_boundary_optimization -value false
##PRS-ADD-6-SPLT: dcrt-only application options.
if {$synopsys_program_name == "dcrt_shell"} {
    set_app_options -as_user_default -name compile.optimization.constant_and_unloaded_propagation_with_no_boundary_optimization -value false
}
##PRS-ADD-6-END: dcrt-only application options.
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable enable_recovery_removal_arcs is translated to application option time.disable_recovery_removal_checks. (MA-074)
## MA  INFO : Variable value true is translated to false. (MA-071)
set_app_options -as_user_default -name time.disable_recovery_removal_checks -value false
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable compile_delete_unloaded_sequential_cells is translated to application option compile.seqmap.remove_unloaded_registers. (MA-074)
##PRS-ADD-7-STR: dcrt-only application options.
# set_app_options -as_user_default -name compile.seqmap.remove_unloaded_registers -value false
##PRS-ADD-7-SPLT: dcrt-only application options.
if {$synopsys_program_name == "dcrt_shell"} {
    set_app_options -as_user_default -name compile.seqmap.remove_unloaded_registers -value false
}
##PRS-ADD-7-END: dcrt-only application options.
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable compile_seqmap_propagate_constants is translated to application option compile.seqmap.remove_constant_registers. (MA-074)
##PRS-ADD-8-STR: dcrt-only application options.
# # # # # # # # # set_app_options -as_user_default -name compile.seqmap.remove_constant_registers -value false
##PRS-ADD-8-SPLT: dcrt-only application options.
if {$synopsys_program_name == "dcrt_shell"} {
    set_app_options -as_user_default -name compile.seqmap.remove_constant_registers -value false
}
##PRS-ADD-8-END: dcrt-only application options.
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable hdlin_shorten_long_module_name is translated to application option hdlin.naming.shorten_long_module_name. (MA-074)
##PRS-ADD-9-STR: dcrt-only application options.
# set_app_options -as_user_default -name hdlin.naming.shorten_long_module_name -value true
##PRS-ADD-9-SPLT: dcrt-only application options.
if {$synopsys_program_name == "dcrt_shell"} {
    set_app_options -as_user_default -name hdlin.naming.shorten_long_module_name -value true
}
##PRS-ADD-9-END: dcrt-only application options.
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable hdlin_module_name_limit is translated to application option hdlin.naming.module_name_limit. (MA-074)
##PRS-ADD-10-STR: dcrt-only application options.
# set_app_options -as_user_default -name hdlin.naming.module_name_limit -value 50
##PRS-ADD-10-SPLT: dcrt-only application options.
if {$synopsys_program_name == "dcrt_shell"} {
    set_app_options -as_user_default -name hdlin.naming.module_name_limit -value 50
}
##PRS-ADD-10-END: dcrt-only application options.
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable template_naming_style is translated to application option hdlin.naming.template_naming_style. (MA-074)
##PRS-ADD-11-STR: dcrt-only application options.
# set_app_options -as_user_default -name hdlin.naming.template_naming_style -value %s
##PRS-ADD-11-SPLT: dcrt-only application options.
if {$synopsys_program_name == "dcrt_shell"} {
    set_app_options -as_user_default -name hdlin.naming.template_naming_style -value %s
}
##PRS-ADD-11-END: dcrt-only application options.
## MA  INFO : Command set is translated to set_app_options. (MA-001)
## MA  INFO : Variable template_parameter_style is translated to application option hdlin.naming.template_parameter_style. (MA-074)
##PRS-ADD-12-STR: dcrt-only application options.
# set_app_options -as_user_default -name hdlin.naming.template_parameter_style -value %s
##PRS-ADD-12-SPLT: dcrt-only application options.
if {$synopsys_program_name == "dcrt_shell"} {
    set_app_options -as_user_default -name hdlin.naming.template_parameter_style -value %s
}
##PRS-ADD-12-END: dcrt-only application options.
### NSGK ### set placer_max_cell_density_threshold 0.80
set GCLK_AND RV40FTMH_Pss_V1p1_T170/TMHAND2CLX20
set GCLK_MUX RV40FTMH_Pss_V1p1_T170/TMHMUX2CLX20
set GCLK_ICG RV40FTMH_Pss_V1p1_T170/TMHGTDPX40
set NEW_SE_PIN XXX_GATED_CLOCK_HOOKUP_TEST_PORT_DUMMY_NAME_XXX
set VERISYN_LATCH X4515
## MA ERROR : Variable compile_clock_gating_through_hierarchy is disabled because it is not supported. (MA-272)
# set compile_clock_gating_through_hierarchy true
set pwr_global_check_boundary_opto false

prelude::separator cstr pcstr

## set module parameter ##
## MA ERROR : Variable suppress_errors is disabled because it is not supported. (MA-272)
# set suppress_errors [concat $suppress_errors [list "CMD-041"]]
set clock_period 1
# @@@ set clk_400_period   [expr $clock_period * 2.400 ]
# @@@ Add NBTI mergine
set clk_400_period [expr $clock_period * 2.300]
set clk_200_period [expr $clock_period * 4.600]
set clk_100_period [expr $clock_period * 9.200]
set clk_gram_200_period [expr $clock_period * 4.600]
set clk_eram_200_period [expr $clock_period * 4.600]
set tck_200_period [expr $clock_period * 4.600]
set lpdclk_200_period [expr $clock_period * 4.600]
set audck_200_period [expr $clock_period * 4.600]
set mcko_period [expr $clock_period * 4.600]

### NSGK ### set top_module_name "X71902"
### NSGK ### set top_module_inst "X71902"
set top_module_name "X5376"
set top_module_inst "X5376"
set script script

## set library ##
##PRS-FLTSCR-STR: flatten snps_scr/uhpsse2xx010_library_HMLVT.tcl
# #source -echo -verbose script/uhpsse2xx010_library.tcl
# source -echo -verbose snps_scr/uhpsse2xx010_library_HMLVt.tcl
##PRS-FLTSCR-SPLT: flatten snps_scr/uhpsse2xx010_library_HMLVT.tcl
## =============================================================================
##
## created by verisyn 3.3
##
##                  VERISYN - SYNTHESIS WORK FRONT END SCRIPT
##                  -----------------------------------------
##
## This script is generated by verisyn command which support logic synthesis.
##
## -----------------------------------------------------------------------------
##       Copyright(C) 2015 Renesas Electronics Corporation. All Rights Reserved.
##
## =============================================================================

## MA ERROR : Variable synlib_wait_for_design_license is disabled because it is not supported. (MA-272)
# set synlib_wait_for_design_license {DesignWare}

set search_path [list "." [format "%s%s" $synopsys_root "/libraries/syn"] [format "%s%s" $synopsys_root "/dw/sim_ver"]]
##PRS-ADD-STR: Add PRS specific search_path entries.
set search_path [concat $search_path $prs_libdir $prs_ntlibdir $prs_desdir $prs_desdir/DB $prs_desdir/CONSTRAINT $prs_desdir/RTL $prs_desdir/DEF $prs_desdir/TECH]
##PRS-ADD-END: Add PRS specific search_path entries.
## MA  INFO : Variable link_library is for Library setup and needs review. (MA-401)
set link_library {}
## MA  INFO : Variable target_library is for Library setup and needs review. (MA-401)
set target_library {}

##PRS-RM-STR: remove unnecessary search_path entry.
# set search_path [concat $search_path ../library/DB]
##PRS-RM-END: remove unnecessary search_path entry.

## MA  INFO : This setting is not required for standard.sldb and dw_foundation.sldb. (MA-642)
## MA  INFO : Variable synthetic_library is for Library setup and needs review. (MA-401)
set synthetic_library {dw_foundation.sldb}

### NSGK ### set link_library [list \
### NSGK ###   "*" \
### NSGK ###   RV40FTHH_Pss_V1p1_T170.db \
### NSGK ###   RV40FTMH_Pss_V1p1_T170.db \
### NSGK ###   RV40FTWH_Pss_V1p1_T170.db \
### NSGK ###   RV40FTLH_Pss_V1p1_T170.db \
### NSGK ###   /design03/M40PT_G/Genji/usr/sawagash/RidersX/Genji.20150724_102718/HARD/RV40F2_SRAM_for_RH850_E2x_DRM0p9_jk1502842_T/liberty_pg/jk1502842_Pss_V1p1_T170_pg_CCS.db \
### NSGK ###   $synthetic_library \
### NSGK ### ]
## MA  INFO : Variable link_library is for Library setup and needs review. (MA-401)
set link_library [list  \
    "*"  \
    RV40FTHH_Pss_V1p1_T170_CCS_pg.db  \
    RV40FTMH_Pss_V1p1_T170_CCS_pg.db  \
    RV40FTLH_Pss_V1p1_T170_CCS_pg.db  \
    RV40FTWH_Pss_V1p1_T170_CCS_pg.db  \
    jk1502842_Pss_V1p1_T170_pg_CCS.db  \
    $synthetic_library]

### NSGK ### set target_library [list \
### NSGK ###   RV40FTWH_Pss_V1p1_T170.db \
### NSGK ###   RV40FTLH_Pss_V1p1_T170.db \
### NSGK ### ]
## MA  INFO : Variable target_library is for Library setup and needs review. (MA-401)
set target_library [list  \
    RV40FTLH_Pss_V1p1_T170_CCS_pg.db  \
    RV40FTMH_Pss_V1p1_T170_CCS_pg.db  \
    RV40FTHH_Pss_V1p1_T170_CCS_pg.db]
### NSGK ### RV40FTHH_Pss_V1p1_T170.db \
  ### NSGK ### RV40FTWH_Pss_V1p1_T170_CCS_pg.db \


##PRS-MVSRC-1-STR: move library cell settings from setup.tcl to cstr.tcl
# #/* $Id: synopsys_config_rv40f2_h.tcl,v 1.4 2012/05/28 04:22:58 mc_suppt Exp mc_suppt $ */
# 
# #####################
# #/* DFF */
# foreach_in_collection lib_cell_tmp [get_lib_cells RV40FTHH_Pss_*/*SDFF* -filter "name !~ *SDFF*U"] {
#     ## MA  INFO : The MA_set_lib_cell_purpose_icg_prep Tcl proc will prepare ICG cells for "set_lib_cell_purpose -exclude cts" command. (MA-644)
#     ## MA  WARN : User attention required.  This command should be called after all libraries and the design are loaded, and should be relocated if necessary. (MA-645)
#     MA_set_lib_cell_purpose_icg_prep
#     ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
#     ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
#     MA_set_dont_use $lib_cell_tmp
#     set_dont_touch $lib_cell_tmp
# }
# ## MA  INFO : Command remove_attribute is translated to MA_remove_attribute. (MA-001)
# MA_remove_attribute [get_lib_cells RV40FTHH_Pss_*/*SDFF*U] dont_use
# ## MA  INFO : Command remove_attribute for attribute dont_touch is translated to set_dont_touch. (MA-042)
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/*SDFF*U] false
# 
# foreach_in_collection lib_cell_tmp [get_lib_cells RV40FTMH_Pss_*/*SDFF* -filter "name !~ *SDFF*U"] {
#     ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
#     ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
#     MA_set_dont_use $lib_cell_tmp
#     set_dont_touch $lib_cell_tmp
# }
# ## MA  INFO : Command remove_attribute is translated to MA_remove_attribute. (MA-001)
# MA_remove_attribute [get_lib_cells RV40FTMH_Pss_*/*SDFF*U] dont_use
# ## MA  INFO : Command remove_attribute for attribute dont_touch is translated to set_dont_touch. (MA-042)
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/*SDFF*U] false
# 
# foreach_in_collection lib_cell_tmp [get_lib_cells RV40FTLH_Pss_*/*SDFF* -filter "name !~ *SDFF*U"] {
#     ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
#     ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
#     MA_set_dont_use $lib_cell_tmp
#     set_dont_touch $lib_cell_tmp
# }
# ## MA  INFO : Command remove_attribute is translated to MA_remove_attribute. (MA-001)
# MA_remove_attribute [get_lib_cells RV40FTLH_Pss_*/*SDFF*U] dont_use
# ## MA  INFO : Command remove_attribute for attribute dont_touch is translated to set_dont_touch. (MA-042)
# set_dont_touch [get_lib_cells RV40FTLH_Pss_*/*SDFF*U] false
# 
# #END /* DFF */
# #####################
# 
# #####################
# #/* LATCH */
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/*DLAT*]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/*DLAT*]
# 
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/*DLAT*]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/*DLAT*]
# 
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTLH_Pss_*/*DLAT*]
# set_dont_touch [get_lib_cells RV40FTLH_Pss_*/*DLAT*]
# 
# if {[info exists VERISYN_LATCH]} {
#     if {$VERISYN_LATCH == "TRUE"} {
#         ## MA  INFO : Command remove_attribute is translated to MA_remove_attribute. (MA-001)
#         MA_remove_attribute [get_lib_cells RV40FTHH_Pss_*/*DLAT*] dont_use
#         ## MA  INFO : Command remove_attribute for attribute dont_touch is translated to set_dont_touch. (MA-042)
#         set_dont_touch [get_lib_cells RV40FTHH_Pss_*/*DLAT*] false
#         
#         ## MA  INFO : Command remove_attribute is translated to MA_remove_attribute. (MA-001)
#         MA_remove_attribute [get_lib_cells RV40FTMH_Pss_*/*DLAT*] dont_use
#         ## MA  INFO : Command remove_attribute for attribute dont_touch is translated to set_dont_touch. (MA-042)
#         set_dont_touch [get_lib_cells RV40FTMH_Pss_*/*DLAT*] false
#         
#         ## MA  INFO : Command remove_attribute is translated to MA_remove_attribute. (MA-001)
#         MA_remove_attribute [get_lib_cells RV40FTLH_Pss_*/*DLAT*] dont_use
#         ## MA  INFO : Command remove_attribute for attribute dont_touch is translated to set_dont_touch. (MA-042)
#         set_dont_touch [get_lib_cells RV40FTLH_Pss_*/*DLAT*] false
#     }
# }
# 
# #END /* LATCH */
# #####################
# 
# #####################
# #/* EPD */
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/*EPD*]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/*EPD*]
# 
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/*EPD*]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/*EPD*]
# 
# ### Add NSGK
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTLH_Pss_*/*EPD*]
# set_dont_touch [get_lib_cells RV40FTLH_Pss_*/*EPD*]
# ### Add NSGK
# 
# #END /* EPD */
# #####################
# 
# #####################
# #/* for Power Compiler */
# ## MA  INFO : Command set_dont_use is translated to set_lib_cell_purpose. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# set_lib_cell_purpose -include none [get_lib_cells RV40FTHH_Pss_*/*GTD*]
# ## MA  INFO : Command set_dont_use is translated to set_lib_cell_purpose. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# set_lib_cell_purpose -include none [get_lib_cells RV40FTMH_Pss_*/*GTD* -filter "name !~ *TMHGTDX20"]
# ## MA  INFO : Command set_dont_use is translated to set_lib_cell_purpose. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# set_lib_cell_purpose -include none [get_lib_cells RV40FTLH_Pss_*/*GTD* -filter "name !~ *TLHGTDX20"]
# ## MA  INFO : Command set_dont_use is translated to set_lib_cell_purpose. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# set_lib_cell_purpose -include none [get_lib_cells RV40FTWH_Pss_*/*GTD* -filter "name !~ *TWHGTDX20"]
# 
# #END /* for Power Compiler */
# #####################
# 
# #####################
# #-- CPU-kai1 Gaide --
# 
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7*]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7*]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL8*]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL8*]
# 
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7*]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7*]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL8*]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL8*]
# 
# ### Add NSGK
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTLH_Pss_*/TLHL7*]
# set_dont_touch [get_lib_cells RV40FTLH_Pss_*/TLHL7*]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTLH_Pss_*/TLHL8*]
# set_dont_touch [get_lib_cells RV40FTLH_Pss_*/TLHL8*]
# ### Add NSGK
# 
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHAN211X05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHAN211X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHAN211X07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHAN211X07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHAN211ZHX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHAN211ZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHAN2BB11X05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHAN2BB11X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHAN2BB11X07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHAN2BB11X07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7AN211X05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7AN211X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7AN211X07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7AN211X07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7AN211ZHX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7AN211ZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7AN211ZLLX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7AN211ZLLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7AN211ZLX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7AN211ZLX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7AN211ZLX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7AN211ZLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7AN2BB11X05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7AN2BB11X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7AN2BB11X07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7AN2BB11X07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7AN2BB11ZHX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7AN2BB11ZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7AN2BB11ZLLX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7AN2BB11ZLLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7AN2BB11ZLX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7AN2BB11ZLX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7AN2BB11ZLX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7AN2BB11ZLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NAND4X05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NAND4X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NAND4ZHHX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NAND4ZHHX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NAND4ZHX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NAND4ZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3BX05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3BX05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3BX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3BX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3BZHX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3BZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3BZLLX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3BZLLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3BZLX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3BZLX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3BZLX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3BZLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3X05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3X07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3X07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3ZHX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3ZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3ZLLX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3ZLLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3ZLX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3ZLX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3ZLX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR3ZLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4BBX05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4BBX05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4BBX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4BBX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4BBZHX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4BBZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4BBZLLX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4BBZLLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4BBZLX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4BBZLX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4BBZLX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4BBZLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4X05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4X07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4X07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4X10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4X10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4ZHHX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4ZHHX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4ZHX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4ZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4ZHX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4ZHX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4ZLLX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4ZLLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4ZLX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4ZLX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4ZLX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHL7NOR4ZLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHNAND4X05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHNAND4X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHNOR3BX05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHNOR3BX05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHNOR3BX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHNOR3BX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHNOR3X05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHNOR3X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHNOR3X07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHNOR3X07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHNOR3ZHX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHNOR3ZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHNOR4BBX05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHNOR4BBX05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHNOR4BBX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHNOR4BBX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHNOR4X05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHNOR4X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHNOR4X07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHNOR4X07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHNOR4X10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHNOR4X10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHNOR4ZHHX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHNOR4ZHHX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHNOR4ZHX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHNOR4ZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHNOR4ZHX10]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHNOR4ZHX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHON31X05]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHON31X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHON31X07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHON31X07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTHH_Pss_*/THHON31ZHX07]
# set_dont_touch [get_lib_cells RV40FTHH_Pss_*/THHON31ZHX07]
# 
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHAN211X05]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHAN211X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHAN211X07]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHAN211X07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHAN211ZHX07]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHAN211ZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHAN2BB11X05]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHAN2BB11X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHAN2BB11X07]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHAN2BB11X07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7AN211X05]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7AN211X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7AN211X07]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7AN211X07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7AN211ZHX07]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7AN211ZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7AN211ZLLX10]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7AN211ZLLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7AN211ZLX07]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7AN211ZLX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7AN211ZLX10]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7AN211ZLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7AN2BB11X05]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7AN2BB11X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7AN2BB11X07]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7AN2BB11X07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7AN2BB11ZHX07]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7AN2BB11ZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7AN2BB11ZLLX10]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7AN2BB11ZLLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7AN2BB11ZLX07]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7AN2BB11ZLX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7AN2BB11ZLX10]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7AN2BB11ZLX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7NAND4X05]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7NAND4X05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7NAND4ZHHX10]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7NAND4ZHHX10]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7NAND4ZHX07]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7NAND4ZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7NOR3BX05]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7NOR3BX05]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7NOR3BX07]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7NOR3BX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7NOR3BZHX07]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7NOR3BZHX07]
# ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
# ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
# MA_set_dont_use [get_lib_cells RV40FTMH_Pss_*/TMHL7NOR3BZLLX10]
# set_dont_touch [get_lib_cells RV40FTMH_Pss_*/TMHL7NOR3BZLLX10]
