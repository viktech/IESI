%
N20; IESI Project 1.5: Facing the Block Implementing Subprograms
N30; O<xxxx) : Facing the Block : Rev. <x>
N40; Material : wax.
N50; 8/8/23 VS
N60;
N70 M98 P0001 (Call Subprogram to initialize machine)
M30 (End of Program)
;
O0001
G90 (Absolute positioning)
G17 (XY plane select)
G20 (Set Units to Inches)
G40 (Cutter radius comp cancel)
G49 (Tool length comp cancel)
G80 (Canned Cycles Cancel)
M99
