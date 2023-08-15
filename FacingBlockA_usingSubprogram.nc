%
N20; IESI Project 1.5: Facing the Block Implementing Subprograms
N30; O<xxxx) : Facing the Block : Rev. <x>
N40; Material : wax.
N50; 8/8/23 VS
N60;
N70 M98 P0001 (Call Subprogram 0001 to initialize machine)
N80 T4 M6 (Change to Tool4 - 3/8" Endmill, 2 Flutes, High Speed Steel)
N90 (Wax Surface Feet Per Minute: 20; Revolutions Per Minute: 204)
N100; 
; set variables for z pass height, za zb zc zd ze corresponding with pass z depth 
; set variables for terminal edge dimensions, xa ya corresponding with edges of face 
; ?set variables for absolute position reading px py? to calculate tool position 
; set variables for feeds and speeds changes, da db dc corresponding with rough, finish, final pass, showing calcs in comments 
; set run increment variable to '0'
; While y pos < `terminal y edge var ya`
;; run O0100 to face along x axis 
;; z lift, return home,
;; increment run counter 

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
;
O0100
; ?turn off absolute positioning? (does it clear the config?)
; turn on relative position
; position tool at 35% of tool diameter
; forward tool across the x axis off the block 
; z-lift, 
; return to x0
; increment y by 35% tool diameter 
