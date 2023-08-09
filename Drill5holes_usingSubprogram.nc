%
N20; IESI Project 2.5: Basic Drilling Implementing Subprograms
N30; O0100 : Drill five holes : Rev. 5
N40; Material : 1050 (wax)
N50; 7/28/23 VS
N60;
N70 G90 G17 G20 G40 G49 G80 (Absolute positioning, XY plane select, inches, Cutter radius comp cancel, Tool length comp cancel, Canned cycle cancel)
N80 T1 M6 ;T4 M6 (Change Tool1)
N90 S917 M3 F4 (Speed 917, Start Spindle, Feed Rate 4 inch per min (feeds and speeds for wax))
N100 G0 G54 X0.000 Y0.000 (Set Datum to Front Left Corner/ Set Work Offset Origin)
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
N430 G00 Z1.000 (Move up Z 1.0 above the Z datum)
N440 M5 (Stop Spindle)
N450 G00 X0.000 Y0.000
N500 M22 (E:\cnc projects\dev\IESI\drill5holes_usingSubprogram.log,A) On @D at @TD for @FN runtime was @TT
N501; (Log date, time, filename, runtime to ./..log)
N550 M30 (End of Program)
;
O2000 (Subprogram for peck drilling routine, .250 depth 2 pecks; .125 per peck)
N1000 G1 Z-0.125 (Peck plunge: 1)
N1010 G0 Z0.000 (Retract to clean)
N1020 G1 Z-0.250 (Peck plunge: 2)
N1030 G0 Z0.000 (Retract to clean)
N1040 G0 Z0.100 (Return to Clearance Plane)
N1050 M99 (Return to P2000 call; Continue Main Program)
;
%
