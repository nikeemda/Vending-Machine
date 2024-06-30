library ieee;
use IEEE.std_logic_1164.all;

entity fsm is
port (clk : in std_logic; 
	init : in std_logic;
	Din : in std_logic_vector (2 downto 0);
	vend : out std_logic;
	change : out std_logic_vector (3 downto 0);
	result : out std_logic_vector (7 downto 0)

 );

end fsm;

architecture fsm of fsm is

type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);

	signal next_state, present_state:state_type;
	begin

	Sreg: process (clk, init)
		begin
			if init = '1' then
				present_state <= s0;
			elsif clk'event and clk = '1' then
				present_state <= next_state;
			else
				present_state <= present_state;
		end if;
	end process;
--s0-reset 
--s1-5 --s2-10 --s3-15 --s4-20 --s5-25 
--s6-30 --s7-35 --s8-40 --s9-45

	C1: process (present_state, din)
		begin -- QDN
			case present_state is
				when s0 =>
					if (din = "001") then --5
						next_state <= s1;
					elsif (din = "010") then --10
						next_state <= s2;
					elsif (din = "100") then --25
						next_state <= s5;
					else
						next_state <= s0;
					end if;

				when s1=> --5
					if (din = "001") then --5+5=10
						next_state <= s2;
					elsif (din = "010") then  --10+5=15
						next_state <= s3;
					else
						next_state <= s1;
					end if;

				when s2 => --10
					if (din = "001") then --5+10=15
						next_state <= s3;
					elsif (din = "010") then --10+10=20
						next_state <= s4;
					elsif (din = "100") then--10+25=35
						next_state <= s7;
					else
						next_state <= s2;
					end if;


				when s3 =>--15
					if (din = "001") then --5+15=20
						next_state <= s4;
					elsif (din = "010") then --10+15=25
						next_state <= s5;
					elsif (din = "100") then --25+15=40
						next_state <= s8;
					else
						next_state <= s3;
					end if;

				when s4 =>--20
					if (din = "001") then --5+20=25
						next_state <= s5;
					elsif (din = "010") then --10+20=30
						next_state <= s6;
					elsif (din = "100") then --20+25=45
						next_state <= s9;
					else
						next_state <= s4;
					end if;

				when s5 =>--25
					next_state <= s0;

				when s6 =>--30
					next_state <= s5;

				when s7 =>--35
					next_state <= s6;

				when s8 =>--40
					next_state <= s7;

				when s9 =>--45
					next_state <= s8;

				when others => null;
		end case;
	end process;



	C2: process(present_state)
		begin
		if (present_state = s0) then
			begin
				result<="00000000";
				change<="0000";
				vend<='0';
			end
		elsif (present_state = s1) then 
			begin
				result<="00000101"; --5
				change<="0000";
				vend<='0';
			end
		elsif (present_state = s2) then
			begin
				result<="00010000";--10
				change<="0000";
				vend<='0';
			end
		elsif (present_state = s3) then
			begin
				result<="00010101"; --15
				change<="0000";
				vend<='0';
			end
		elsif (present_state = s4) then 
			begin
				result<="00100000";--20
				change<="0000";
				vend<='0';
			end
		elsif (present_state = s5) then
			begin
				result<="00100101"; --25
				change<="0000";
				vend<='1';
			end
		elsif (present_state = s6) then
			begin
				result<="00110000"; --30
				change<="0001";
				vend<='1';
			end
		elsif (present_state = s7) then 
			begin
				result<="00110101"; --35
				change<="0010";
				vend<='1';
			end
		elsif (present_state = s8) then
			begin
				result<="01000000"; --40
				change<="0011";
				vend<='1';
			end
		elsif (present_state = s9) then
			begin
				result<="01000101"; --45
				change<="0100";
				vend<='1';
			end
	
		end if;
end process C2;




end behavior;