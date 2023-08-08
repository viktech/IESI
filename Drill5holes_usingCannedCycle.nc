%
N20; IESI Project 2.51: Basic Drilling Implementing Canned Cycles through Subprograms
N30; O0100 : Drill five holes : Rev. 5
N40; Material : wax.
N50; 8/8/23 VS
N60;
N70 P0001
N80 T1 M6 (Change Tool1)
N90 S917 M3 F4 (Speed 917, Start Spindle, Feed Rate 4 inch per min)
N100 G0 G54 X0.000 Y0.000 Z0.000 (Set Datum to Front Left Corner/ Set Work Offset Origin)
N110 G0 X0.000 Y0.000 Z0.100 (Datum + Clearance Plane)
N120 G0 X0.8125 Y0.500 (Hole1)
N130 M98 P2000 (Call Subprogram for peck drilling routine)
N180 G0 X0.8125 Y1.000 (Hole2)
N200 M98 P2000 (Call Subprogram for peck drilling routine)
N240 G0 X1.6250 Y0.750 (Hole3)
N250 M98 P2000 (Call Subprogram for peck drilling routine)
N300 G0 X2.4375 Y1.000 (Hole4)
N350 M98 P2000 (Call Subprogram for peck drilling routine)
N360 G0 X2.4375 Y0.500 (Hole5)
N400 M98 P2000 (Call Subprogram for peck drilling routine)
N420; M9 (Coolant Off; No coolant needed for wax)
N430 M5 (Stop Spindle)
N440 G0 Z3.000 (Move spindle above stock 3")
N450 G0 X0 Y0 (Move spindle home 0,0)
N500 M22 (drill5holes_usingSubprogram.log,A) On @D at @TD for @FN runtime was @TT; (Log date,time,filename,runtime to ./..log)
N550 M30 (End of Program)
;
O0001 (Subprogram to initialize machine
G90 (Absolute positioning)
G17 (XY plane select)
G20 (Set Units to Inches)
G40 (Cutter radius comp cancel)
G49 (Tool length comp cancel)
G80 (Cancel Canned Cycles)
M99
;
O2000 (Subprogram for canned peck drilling, .250 depth 2 pecks; .125 per peck)
(Gcode peck drill params)
N610 M99 (Return to P2000 call; Continue Main Program)
;
%
