create or replace procedure proc_grade (v_roll IN number)                                                                      
IS                                                                                                                   
v_itr stud_marks%ROWTYPE ;                                                                                        
v_class varchar (30);                                                                                                 
BEGIN                                                                                                                
SELECT * INTO v_itr FROM stud_marks WHERE stud_marks.roll = v_roll;                                                   
IF v_itr.roll BETWEEN 990 AND 1500 THEN                                                                              
v_class :='DISTINCTION'                                                                                              
INSERT INTO result (v_itr.name, v_itr.roll, v_class )                                                              
END IF;                                                                                                             
IF v_itr.roll BETWEEN 900 AND 989 THEN                                                                           
v_class := 'FIRST CLASS'                                                                                            
INSERT INTO result (v_itr.name, v_itr.roll, v_class )                                                              
END IF;                                                                                                          
IF v_itr.roll BETWEEN 825 AND 889 THEN                                                                           
v_class := ''HIGHER SECOND CLASS'                                                                                   
INSERT INTO result (v_itr.name, v_itr.roll, v_class )                                                               
END IF;                                                                                                          
END;                                                                                                                
 /               