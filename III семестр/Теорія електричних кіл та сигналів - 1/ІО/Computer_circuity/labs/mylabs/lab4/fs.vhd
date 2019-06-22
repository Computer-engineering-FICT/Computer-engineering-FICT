entity MUX8 is port(D0,D1,D2,D3,D4,D5,D6,D7: in bit; -- входы данных
                    A: in bit_vector(2 downto 0); -- адрес
                    Q: out bit);                  -- выход данного
end MUX8; 
architecture STR of MUX8 is 
 signal mux0,mux1:bit; 
 begin   
   U_MUX0: entity PLM_6(PLM_MUX)  
       port map(F=>D3,E=>D2,D=>D1,C=>D0,B=>A(1),A=>A(0),Y=>mux0); 
   U_MUX1: entity PLM_6(PLM_MUX)  
       port map(F=>D7,E=>D6,D=>D5,C=>D4,B=>A(1),A=>A(0),Y=>mux1); 
   U_MUX3: entity PLM_3(PLM_MUX)  
       port map(C=>mux1,B=>mux0,A=>A(2),Y=>Q); 
end STR; 