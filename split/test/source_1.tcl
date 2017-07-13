# place.coarse.max_density                                                             float   --        0.8              0                  block normal
set_app_options -name place.coarse.max_density -value 0.8
# time.case_analysis_propagate_through_icg                                             bool    --        true             false              block normal
set_app_options -name time.case_analysis_propagate_through_icg -value true
# time.enable_clock_to_data_analysis                                                   bool    --        true             false              block normal
set_app_options -name time.enable_clock_to_data_analysis -value true
# time.port_slew_derate_from_library                                                   float   --        0.5              1                  block normal
set_app_options -name time.port_slew_derate_from_library -value 0.5
# time.port_slew_lower_threshold_fall                                                  float   --        30               20                 block normal
source source_2.tcl
set_app_options -name time.port_slew_lower_threshold_fall -value 20
# time.port_slew_lower_threshold_rise                                                  float   --        30               20                 block normal
set_app_options -name time.port_slew_lower_threshold_rise -value 20
# time.port_slew_upper_threshold_fall                                                  float   --        70               80                 block normal
set_app_options -name time.port_slew_upper_threshold_fall -value 80
# time.port_slew_upper_threshold_rise                                                  float   --        70               80                 block normal
set_app_options -name time.port_slew_upper_threshold_rise -value 80
##PRS-ADD-1-END: make up block scoped application options to fix sanity check mismatch.

prelude::separator rtlscr cstr

foreach_in_collection lib_cell_tmp [get_lib_cells RV40FTMH_Pss_*/*SDFF* -filter "name !~ *SDFF*U"] {
    ## MA  INFO : Command set_dont_use is translated to MA_set_dont_use. (MA-001)
    ## MA  WARN : The command set_lib_cell_purpose must be executed after the design is read in Descartes. Please move this command if necessary. (MA-604)
    MA_set_dont_use $lib_cell_tmp
    set_dont_touch $lib_cell_tmp
}
source source_3.tcl
## MA  INFO : Command remove_attribute is translated to MA_remove_attribute. (MA-001)
MA_remove_attribute [get_lib_cells RV40FTMH_Pss_*/*SDFF*U] dont_use
## MA  INFO : Command remove_attribute for attribute dont_touch is translated to set_dont_touch. (MA-042)
set_dont_touch [get_lib_cells RV40FTMH_Pss_*/*SDFF*U] false
