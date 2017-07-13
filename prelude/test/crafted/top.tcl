#!/usr/bin/tclsh

source ../prelude.tcl
prelude::start_track_source

puts "This is the top script."

# plain source of lv1.tcl
source lv1.tcl

# source lv1.tcl with -echo and -verbose
source lv1.tcl

# source lv1.tcl in a foreach loop
foreach _ [lrepeat 4 ""] {
    source lv1.tcl
}

# source in a redirect
redirect -file /dev/null {source lv1.tcl}

prelude::stop_track_source
exit
