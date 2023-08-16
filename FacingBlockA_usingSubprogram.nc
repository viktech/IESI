%
Title: Facing the Block
Organization: IESI
Project: 1 
Code Revision: 5 - Implementing Subprograms
Blueprint: "Facing the Block"
Blueprint Rev.: <x>
Material: 1060(?) (Simulated using wax)
Machine: Intellitek (6000?)
Creation Date: 8/8/23
Author: VS
N60;
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
;
M98 P0001 (Call Subprogram 0001 to initialize machine)
T4 M6 (Change to Tool4 - 3/8" Endmill, 2 Flutes, HSS)
M98 P0010 (Call Subprogram to set Feed and Speed Variables)
N90 S#4 M3 F#2 (Start Spindle, Speed, Feed)
G01 X0.000 Y0.000 Z.100
N100;






N110 #1=20.(Cutting Speed (SFM/Surface Feet per Minute),(IPM/Inches per Minute = #1*12)
N120 #2=.(IPM (Feed per Tooth x Num. of Flutes x Revs per Min)(240*2*(20*3.82)))
N130 #3=.3750.(Cutter Dia. (Inch))
N140 #4=2.(Number of Flutes)
N150 #101=ROUND[[#1*12]/[[#3/25.4]*3.14159]] (Calculated Speed in RPM)(IPM/
N160 #102=[#4*#2*#101*25.4] (Calculated Feed in IPM)
N170;
;
; 
; ?set variables for absolute position reading px py? to calculate tool position 
;  do math for rough, finish, final pass
; set run increment variable to '0'
; set position increment variable to '0'
; While y pos < `terminal y edge var ya`
;; run O0100 to face along x axis 
;; z lift, return home,
;; increment run counter by 1. Increment position by half tool diameter
; add 

M30 (End of Program)
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
; position tool at 35% of tool diameter
; forward tool across the x axis off the block 
; z-lift, 
; return to x0
; increment y by 35% tool diameter
M99
;
%
