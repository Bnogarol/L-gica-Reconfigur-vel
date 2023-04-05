entity decod7seg is
    port(
        sel :   in  bit;
        i   :   in  bit_vector(0 to 3);
        led :   out bit_vector(7 downto 0)
	);
end entity;

architecture logic of decod7seg is

    signal optLed1 : bit_vector(7 downto 0);
    signal optLed2 : bit_vector(7 downto 0);
	
    type my_array is array (0 to 16) of bit_vector(7 downto 0);
    constant s  :   my_array := (
        "00111111",
        "00000110",
        "01011011",
        "01001111",
        "01100110",
        "01101101",
        "01111101",
        "00000111",
        "01111111",	
        "01100111",
        "01110111",
        "01111100",
        "00111001",
        "01011110",
        "01111001",
        "01110001",
        "10000000"
    );
begin

    with i select
     
        optLed1 <=  not s(0)    when "0000",--0
                    not s(1)    when "0001",--1
                    not s(2)    when "0010",--2
                    not s(3)    when "0011",--3
                    not s(4)    when "0100",--4
                    not s(5)    when "0101",--5
                    not s(6)    when "0110",--6
                    not s(7)    when "0111",--7
                    not s(8)    when "1000",--8			
                    not s(9)    when "1001",--9
                    not s(10)   when "1010",--A
                    not s(11)   when "1011",--B
                    not s(12)   when "1100",--C
                    not s(13)   when "1101",--D
                    not s(14)   when "1110",--E
                    not s(15)   when "1111",--F
                    not s(16)   when others;--.
						
	optLed2 <= 	not s(0) 	when i = "0000" else
				not s(1)   	when i = "0001" else
				not s(2)   	when i = "0010" else
				not s(3)   	when i = "0011" else
				not s(4)   	when i = "0100" else
				not s(5)   	when i = "0101" else
				not s(6)   	when i = "0110" else
				not s(7)   	when i = "0111" else
				not s(8)   	when i = "1000" else			
				not s(9)   	when i = "1001" else
				not s(10) 	when i = "1010" else
				not s(11)   when i = "1011" else
				not s(12)   when i = "1100" else
				not s(13)   when i = "1101" else
				not s(14)   when i = "1110" else
				not s(15)   when i = "1111" else
				not s(16);
			
	led <=  optLed1 when sel = '0' else
			  optLed2;
	
end architecture;
	
