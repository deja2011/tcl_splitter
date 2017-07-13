# ================================================================
# Prelude utility for PRS design porting 
# Author:       Lawrence Li
# Last Update:  Sep. 9, 2016
# Version:      2.0
# Usage: Add following code block to the begining of top-level script
#  -------------------------------------------------------------------
# | source /remote/pv/repo/user/zcli/design_porting.tools/prelude.tcl |
# | prelude::enable_prelude                                           |
#  -------------------------------------------------------------------
# ================================================================

if {[namespace exists prelude]} {
    error "PRELUDE: Namespace \"prelude\" already exists."
}

namespace eval prelude {
    variable log_name
    variable log
    variable count
    variable source_level
    variable source_report
    variable frame_step
    variable flag_track_source false
}

# proc prelude::leave_source {cmdtext code result op} {
#     puts $prelude::log "PRELUDE-source: inside [info script]"
#     puts $prelude::log "  $cmdtext"
# }
# 
# proc prelude::enter_compile {args} {
#     set cmd [lindex [lindex $args 0] 0]
#     puts $prelude::log "PRELUDE-Info: About to launch $cmd inside\
#     [info script], exit."
#     # prelude::exit
#     exit
# }
# 
# proc prelude::enter_exit {args} {
#     close $prelude::log
#     # ::exit
# }
# 
# proc prelude::enable_prelude {args} {
#     if {[info exists ::prs_tool] && [info exists ::prs_design]} {
#         set prelude::log_name "${::prs_design}.${::prs_tool}.prelude.out"
#     } elseif {![file exists "prelude.out"]} {
#         set prelude::log_name "prelude.out"
#     } else {
#         set prelude::count 1
#         while {[file exists "prelude.${prelude::count}.out"]} {
#             incr prelude::count
#         }
#         set prelude::log_name "prelude.${prelude::count}.out"
#     }
#     
#     puts "PRELUDE-Info: Prelude is activated. Records will be stored in\
#     ${prelude::log_name}."
# 
#     set prelude::log [open $prelude::log_name "w"]
# 
#     trace add execution source leave prelude::leave_source
#     trace add execution exit enter prelude::enter_exit
#     trace add execution quit enter prelude::enter_exit
# 
#     if {[lsearch $args "-exit_before_compile"] >= 0} {
#         trace add execution compile enter prelude::enter_compile
#     }
# }
# 
# proc prelude::init {args} {
# 
#     # Setup prelude log file
#     if {[info exists ::prs_tool] && [info exists ::prs_design]} {
#         set prelude::log_name "${::prs_design}.${::prs_tool}.prelude.out"
#     } elseif {![file exists "prelude.out"]} {
#         set prelude::log_name "prelude.out"
#     } else {
#         set prelude::count 1
#         while {[file exists "prelude.${prelude::count}.out"]} {
#             incr prelude::count
#         }
#         set prelude::log_name "prelude.${prelude::count}.out"
#     }
#     puts "PRELUDE-Info: Prelude is activated. Records will be stored in ${prelude::log_name}."
#     set prelude::log [open $prelude::log_name "w"]
# 
# }


proc prelude::start_track_source {args} {
    if {$prelude::flag_track_source} {
        error "PRELUDE: track-source is already turned on."
        return
    }
    rename ::source ::the_real_source
    rename prelude::source_wrapper ::source
    puts "PRELUDE: Original source is replaced with a wrapper command. All source command will be tracked."
    puts "         Records are kept in source_tree.txt ."
    # Initiate prelude variables.
    set prelude::flag_track_source true
    set prelude::source_level 0
    set prelude::frame_step 4
    set prelude::source_report [open "source_tree.txt" "w"]
    # Record top level script in file output.
    puts ${prelude::source_report} [file normalize [info script]]
    # Add trace to guarantee file handler is closed before session exits
    trace add execution exit enter prelude::stop_track_source
    trace add execution quit enter prelude::stop_track_source
}

proc prelude::source_wrapper {args} {
    set indent 2
    set line_number [dict get [info frame [expr {[info frame] - $prelude::frame_step}]] line]
    set script_path [file normalize [info script]]
    foreach arg $args {
        if {[string range $arg 0 0] == "-"} {
            # skip options
        } else {
            set target_path [file normalize [which $arg]]
            break
        }
    }
    puts "PRELUDE: source at $line_number $script_path" 
    puts -nonewline ${prelude::source_report} [string repeat " " [expr {$prelude::source_level * $indent}]
    puts ${prelude::source_report} "$line_number $target_path"
    incr prelude::source_level
    uplevel 1 ::the_real_source $args
    incr prelude::source_level "-1"
}

proc prelude::stop_track_source {args} {
    if {!($prelude::flag_track_source)} {
        error "PRELUDE: track-source is already turned off."
        return
    }
    if {[llength [info commands ::the_real_source]] == 1} {
        rename ::source prelude::source_wrapper
        rename ::the_real_source ::source
    }
    puts "PRELUDE: Original source command is restored."
    close $prelude::source_report
    set prelude::flag_track_source false
}
