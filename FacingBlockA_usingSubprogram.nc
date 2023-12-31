%
; Title: Facing the Block, Containerized for Reuse
; Organization: IESI
; Project: 1 
; Code Revision: 5 - Implementing Subprograms, Variables, and Loops
; Blueprint: "Facing the Block"
; Blueprint Rev.: <x>
; Material: 1060(?) (Simulated using wax)
; Machine: Intellitek (6000?) CNC
; Tool: 3/8 In Endmill, 2 Flutes, HSS
; Creation Date: 8/8/23
; Author: VS
; ____________________________________________
;
; Variables Block
N100 #0=4 (Tool Slot)
N110 #1=.3750 (Tool Diameter)
N120 #2=20 (Surface Feet Per Minute (Feed))
N130 #3=2 (Number of Flutes)
N131 #4= (Revolutions Per Minute (Speed))
#5=4 (Number of Passes)
#10= (Nominal X)
#11= (Nominal Y)
#12= (Nominal Z)
#13= (Observed X)
#14= (Observed Y)
#15= (Observed Z)
#1000=0 (Y Position Counter (Do not change))
#1001=0 (Z Position Counter (Do not change))
; ____________________________________________
;
; Execution Block 
M98 P0001 (Initialize machine)
M98 P0010 (Feed and Speed Variables)
S#4 M3 F#2 (Start Spindle. Thank you, driver)
;
WHILE [#1000 LE #14] DO1 (Y-Pos <= Max Y)
M98 P0100 (Facing Pass)
#1000=[#1000+[#1/2]] (Increment Y-Pos by Tool Radius)
END1
;
M5 (Stop Spindle.  Good work, tool)
M98 P0999 (Clean Up)
M30 (End of Program)
; ____________________________________________
;
O0001 (Machine Initialization Subprogram)
G90 (Absolute positioning)
G17 (XY plane select)
G20 (Set Units to Inches)
G40 (Cutter radius comp cancel)
G49 (Tool length comp cancel)
G80 (Canned Cycles Cancel)
G00 G54 X0.000 Y0.000 (Set Work Offset Origin to Datum)
G01 X0.000 Y0.000 Z.100 (Move to Origin, Clearance Plane)
; Good Luck
M99
;
O0010 (Feed and Speed Calculation Subprogram)
#100=[#2*12] (Surface Inches per Minute)
#101=ROUND[[#2*3.82]/#1] (Revolutions Per Minute)
#102=[[[#100]/#101]/#3] (Inches Per Tooth)
#103=[#101*#3*#102] (Inches Per Minute (Feed))
#104=[#100/#101] (Inches Per Revolution)
M99
;
O0011 (Material Removal Calculation Subprogram)
#9000=[[#15-#12]/2]
#9001=[#9000*.7]
#9002=[#9000*.2]
#9003=[#9000*.07]
#9004=[#9000*.03]
M99
;
O0100 (Facing Pass Subprogram)
G01 Z.1000
G01 X0.000 Y#1000
G91 (Relative positioning)
; position tool at 50% of tool diameter
; at feed speed, forward tool across the x axis off the block 
; z-lift, 
; return to x0
; increment y by 50% tool diameter
M99
;
O0999 (Clean Up Subprogram)
; z lift
; xy home
; log to file
M99
;
%
; thanks, hardware. thanks interpreter. thanks software. until next time :)
