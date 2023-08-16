%
Title: Facing the Block
Organization: IESI
Project: 1 
Code Revision: 5 - Implementing Variables, Subprograms, and Loops
Blueprint: "Facing the Block"
Blueprint Rev.: <x>
Material: 1060(?) (Simulated using wax)
Machine: Intellitek (6000?)
Tool: 3/8 in Endmill, 2 Flutes, HSS
Creation Date: 8/8/23
Author: VS
N60; ____________________________________________
N70;
; Variable Block
N100 #0=4 (Tool Slot)
N110 #1=.3750 (Tool Diameter)
N120 #2=20 (Surface Feet Per Minute (Feed))
N130 #3=2 (Number of Flutes)
N131 #4= (Revolutions Per Minute (Speed))
#10= (Nominal X)
#11= (Nominal Y)
#12= (Nominal Z)
#13= (Observed X)
#14= (Observed Y)
#15= (Observed Z)
#1000=0 (Y Tool Position (Do not change))
#1001=0 (Run Counter (Do not change))
; ____________________________________________
;
; Execution Block 
M98 P0001 (Initialize machine)
M98 P0010 (Feed and Speed Variables)
N90 S#4 M3 F#2 (Start Spindle)
G01 X0.000 Y0.000 Z.100 (Move to Origin, Clearance Plane)


M30 (End of Program)
;
; 
; ?set variables for absolute position reading px py? to calculate tool position 
;  do math for rough, finish, final pass
; While y pos < `terminal y edge var ya`
;; run O0100 to face along x axis 
;; z lift, return home,
;; increment run counter by 1. Increment position by half tool diameter
; add 


; ____________________________________________
;
O0001 (Machine Initialization Subprogram)
G90 (Absolute positioning)
G17 (XY plane select)
G20 (Set Units to Inches)
G40 (Cutter radius comp cancel)
G49 (Tool length comp cancel)
G80 (Canned Cycles Cancel)
G00 G54 X0.000 Y0.000 (Set Datum to Front Left Corner/ Set Work Offset Origin)
M99
;
O0010 (Feed and Speed Calculation Subprogram)
#100=[#2*12] (Surface Inches per Minute)
#101=ROUND[[#2*3.82]/#1] (Revolutions Per Minute)
#102=[[[#100]/#101]/#3] (Inches Per Tooth)
#103=ROUND[#101*#3*#102] (Inches Per Minute (Feed))
#104=[#100/#101] (Inches Per Revolution)
M99
;
O0100 (Facing Pass Subprogram)
; ?turn off absolute positioning? (does it clear the config?)
; turn on relative position
; position tool at 50% of tool diameter
; forward tool across the x axis off the block 
; z-lift, 
; return to x0
; increment y by 50% tool diameter
M99
;
%
