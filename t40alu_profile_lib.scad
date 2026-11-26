     module t40() {polygon(points=[[0,0],[0,5.9],[4.5,5.9],[4.79,6.1],[9.74,11.12],[10.25,12.18],[10.25,17.39],[9.45,18.2],[7.2,18.2],[6.5,17.3],[6.5,15.5],[4.1,15.5],[4.1,19],[5.1,19],[5.1,20],[16.2,20],[17.7,19.7],[19,19],[17.33,17.33],[15,18.5],[12.5,18.5],[11.55,17.34],[11.55,12.7],[12.10,12.10]]);}
     
     module t40plain_side() {polygon(points=[[0,0],[0,5.9],[4.5,5.9],[4.79,6.1],[9.74,11.12],[10.25,12.18],[10.25,17.39],[9.45,18.2],[0,18.2],[0,20],[16.2,20],[17.7,19.7],[19,19],[17.33,17.33],[15,18.5],[12.5,18.5],[11.55,17.34],[11.55,12.7],[12.10,12.10]]);}
     
     module t40expansion_insert() {polygon(points=[[0,0],[0,5.9],[4.5,5.9],[4.79,6.1],[9.74,11.12],[10.25,12.18],[10.25,17.39],[9.45,18.2],[7.2,18.2],[6.5,17.3],[6.5,15.5],[4.1,15.5],[4.1,19],[5.1,19],[5.1,20],[20,20],[20,18.5],[15,18.5],[12.5,18.5],[11.55,17.34],[11.55,12.7],[11.55,10.1],[5.9,4.49],[5.9,0]]);}
     
     module t40_no_hole() {polygon(points=[[0,0],[0,5.9],[4.5,5.9],[4.79,6.1],[9.74,11.12],[10.25,12.18],[10.25,17.39],[9.45,18.2],[7.2,18.2],[6.5,17.3],[6.5,15.5],[4.1,15.5],[4.1,19],[5.1,19],[5.1,20],[16.2,20],[17.7,19.7],[19,19],[17.33,17.33]]);}
     
     module t40plain_side_no_hole() {polygon(points=[[0,0],[0,5.9],[4.5,5.9],[4.79,6.1],[9.74,11.12],[10.25,12.18],[10.25,17.39],[9.45,18.2],[0,18.2],[0,20],[16.2,20],[17.7,19.7],[19,19],[17.33,17.33]]);}
     
     module t40expansion_insert_no_hole() {polygon(points=[[0,0],[0,5.9],[4.5,5.9],[4.79,6.1],[9.74,11.12],[10.25,12.18],[10.25,17.39],[9.45,18.2],[7.2,18.2],[6.5,17.3],[6.5,15.5],[4.1,15.5],[4.1,19],[5.1,19],[5.1,20],[20,20],[20,0]]);}
     
     module t40_no_hole_no_slit() {polygon(points=[[0,0],[0,15.5],[4.1,15.5],[4.1,19],[5.1,19],[5.1,20],[16.2,20],[17.7,19.7],[19,19],[17.33,17.33]]);}
     
     module t40plain_side_no_hole_no_slit() {polygon(points=[[0,0],[0,20],[16.2,20],[17.7,19.7],[19,19],[17.33,17.33]]);}
     
     module t40expansion_insert_no_hole_no_slit() {polygon(points=[[0,0],[0,15.5],[4.1,15.5],[4.1,19],[5.1,19],[5.1,20],[20,20],[20,0]]);}
    
    //for tolerance setting see offset() manual, I wish you can place circle ja diameter 6.8mm by yourself using those polygones, this was written using "blueprint" obtained from ali seller, so I can recommend always use the offset.
     
     tolerance=0; //for fdm printers it will be wise to use half of your nozzle diameter as tolerance for printed on xy plane prints
     sections=1; //use for lego-like playing
     

    
 module plate_40_profile(tolerance,sections) {
 offset(delta=tolerance) {
 mirror([1,0,0]) t40(); 
 rotate([0,0,90]) t40();   
 rotate([0,0,90]) mirror([1,0,0]) t40();
 rotate([0,0,180]) t40();}
  if (sections==1) {for (i=[0:3]) {offset(delta=tolerance) {
      rotate([0,0,90*i]) {t40(); mirror([1,0,0]) t40();}}}}
  else {    
   for(i=[0:sections-2]) { union(){
   translate ([i*40,0,0]){
    union() {offset(delta=tolerance) {
     t40expansion_insert();        
     mirror ([0,1,0]) t40expansion_insert();
     translate([40,0,0]) mirror ([1,0.0]) t40expansion_insert();
     translate([40,0,0]) rotate ([0,0,180]) t40expansion_insert();}}}
    for(i=[0:sections-2]) { if (i==sections-2) {
     translate ([40+i*40,0,0]){ offset(delta=tolerance) {
     t40(); 
     rotate([0,0,270]) t40();
     rotate([0,0,270]) mirror([1,0,0]) t40();
     rotate([0,0,180]) mirror([1,0,0]) t40();}}}}}}}}
     
     
 module holes_40_profile (tolerance,sections) 
     for(i=[0:sections-1])
     {translate ([i*40,0,0]) circle(d=6.8-tolerance*2);}
     
 module plate_40_profile_no_hole(tolerance,sections) {
 offset(delta=tolerance) {
 mirror([1,0,0]) t40_no_hole(); 
 rotate([0,0,90]) t40_no_hole();   
 rotate([0,0,90]) mirror([1,0,0]) t40_no_hole();
 rotate([0,0,180]) t40_no_hole();}
  if (sections==1) {for (i=[0:3]) {offset(delta=tolerance) {
      rotate([0,0,90*i]) {t40_no_hole(); mirror([1,0,0]) t40_no_hole();}}}}
  else {    
   for(i=[0:sections-2]) { union(){
   translate ([i*40,0,0]){
    union() {offset(delta=tolerance) {
     t40expansion_insert_no_hole();        
     mirror ([0,1,0]) t40expansion_insert_no_hole();
     translate([40,0,0]) mirror ([1,0.0]) t40expansion_insert_no_hole();
     translate([40,0,0]) rotate ([0,0,180]) t40expansion_insert_no_hole();}}}
    for(i=[0:sections-2]) { if (i==sections-2) {
     translate ([40+i*40,0,0]){ offset(delta=tolerance) {
     t40_no_hole(); 
     rotate([0,0,270]) t40_no_hole();
     rotate([0,0,270]) mirror([1,0,0]) t40_no_hole();
     rotate([0,0,180]) mirror([1,0,0]) t40_no_hole();}}}}}}}}
 module plate_40_profile_no_hole_no_slit(tolerance,sections) {
 offset(delta=tolerance) {
 mirror([1,0,0]) t40_no_hole_no_slit(); 
 rotate([0,0,90]) t40_no_hole_no_slit();   
 rotate([0,0,90]) mirror([1,0,0]) t40_no_hole_no_slit();
 rotate([0,0,180]) t40_no_hole_no_slit();}
  if (sections==1) {for (i=[0:3]) {offset(delta=tolerance) {
      rotate([0,0,90*i]) {t40_no_hole_no_slit(); mirror([1,0,0]) t40_no_hole_no_slit();}}}}
  else {    
   for(i=[0:sections-2]) { union(){
   translate ([i*40,0,0]){
    union() {offset(delta=tolerance) {
     t40expansion_insert_no_hole_no_slit();        
     mirror ([0,1,0]) t40expansion_insert_no_hole_no_slit();
     translate([40,0,0]) mirror ([1,0.0]) t40expansion_insert_no_hole_no_slit();
     translate([40,0,0]) rotate ([0,0,180]) t40expansion_insert_no_hole_no_slit();}}}
    for(i=[0:sections-2]) { if (i==sections-2) {
     translate ([40+i*40,0,0]){ offset(delta=tolerance) {
     t40_no_hole_no_slit(); 
     rotate([0,0,270]) t40_no_hole_no_slit();
     rotate([0,0,270]) mirror([1,0,0]) t40_no_hole_no_slit();
     rotate([0,0,180]) mirror([1,0,0]) t40_no_hole_no_slit();}}}}}}}}
     
module 40_profile(tolerance,sections) {
    difference (){
    plate_40_profile(tolerance,sections);
    holes_40_profile(tolerance,sections);}}

module 40_profile_no_hole(tolerance,sections) {
    difference (){
    plate_40_profile_no_hole(tolerance,sections);
    holes_40_profile(tolerance,sections);}}
    
module 40_profile_no_hole_no_slit(tolerance,sections) {
    difference (){
    plate_40_profile_no_hole_no_slit(tolerance,sections);
    holes_40_profile(tolerance,sections);}}
    
    
        
            
   // translate ([20,-42,0]) 40_profile(0,6);
    //translate ([20,-84,0]) plate_40_profile(0,6);
   //translate ([20,-126,0]) 40_profile_no_hole(0,6);
   // translate ([20,-168,0]) plate_40_profile_no_hole(0,6);
   //translate ([20,-210,0]) 40_profile_no_hole_no_slit(0,6);
   // translate ([20,-253,0]) plate_40_profile_no_hole_no_slit(0,6);
    
    
    //you can use this lib to generate profile alike 40_profile(tolerance=x,sections=y)
    
    
    //uncomment example below to see all those polygones
    //t40();
    //translate ([22,0,0])t40expansion_insert();
    //translate ([44,0,0])t40plain_side();
    //translate ([0,22,0])t40_no_hole();
    //translate ([22,22,0])t40expansion_insert_no_hole();
    //translate ([44,22,0])t40plain_side_no_hole();
    //translate ([0,45,0])t40expansion_insert_no_hole_no_slit();
    //translate ([22,45,0])t40expansion_insert_no_hole_no_slit();
    //translate ([44,45,0])t40plain_side_no_hole_no_slit();
    
    //"People always have been the foolish victims of deception and self-deception in politics, and they always will be until they have learnt to seek out the interests of some class or other behind all moral, religious, political and social phrases, declarations and promises."
    //Written by Kifa Paras Kommari Mar 2021 celestia@waifu.club
    //CC Public Domain 