library IEEE;                                                        
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
 
entity conta_updown is
  port (clk: in std_logic;
    reset: in std_logic;
     sobedesce: in std_logic;
     carry_out: out std_logic;
    q: out std_logic_vector(3 downto 0)
    );
end conta_updown;
 
architecture arquitetura of conta_updown is
begin
    process(clk,reset)                                  
    variable qtemp: std_logic_vector(3 downto 0);  
    begin
        if reset='1' then
        qtemp:="0000";                                            
       
        else       
            if clk'event and clk='1' then  
               
                if sobedesce='1' then   ---     QUANDO sobedesce FOR 1
                    if qtemp<9 then     ---
                    qtemp:=qtemp+1;      ---                              
                    carry_out <= '0';       ---
                    else                        ---     CONTADOR CRESCENTE
                    qtemp:="0000";       ---                                  
                    carry_out <= '1';       ---
                    end if;                 ---
----------------------------------------------------------------
                else                            --- QUANDO sobedesce FOR 0
                    if qtemp>0 then     ---
                    qtemp:=qtemp-1;     ---
                    carry_out <= '0';       ---
                    else                        --- CONTADOR DECRESCENTE
                    qtemp:="1001";          ---
                    carry_out <= '1';       ---
                    end if;                 ---
                   
                end if;
            end if;
        q<=qtemp;                                                
        end if;
    end process;                                                      
end arquitetura;