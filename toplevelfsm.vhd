Library ieee; 

use ieee.std_logic_signed.all;
use ieee.std_logic_1164.all;

entity toplevelfsm is
	port ( Din: in std_logic_vector(2 downto 0);
   	    Clk: in std_logic;
	    Init: in std_logic;
    	    Result: out std_logic_vector(7 downto 0);
    	    ResultL: out std_logic_vector(6 downto 0);
    	    ResultR: out std_logic_vector(6 downto 0);
	    Change: out std_logic_vector (7 downto 0);
	    ChangeL: out std_logic_vector(6 downto 0);
    	    ChangeR: out std_logic_vector(6 downto 0);
	    Change_pulse: out std_logic;
    	    Vend: out std_logic);
end entity;

architecture behav of toplevelfsm is

component statemachine
	Port (clk : in std_logic; 
		init : in std_logic;
		Din : in std_logic_vector (2 downto 0);
		vend : out std_logic;
		change : out std_logic_vector (7 downto 0);
		change_pulse : out std_logic;
		result : out std_logic_vector (7 downto 0));
end component;

component DisplayCkt is
	port(Input: in std_logic_vector(3 downto 0); 
		SevenSeg : out std_logic_vector(6 downto 0)); 
end component;

signal C: std_logic_vector ( 7 downto 0);
signal R: std_logic_vector ( 7 downto 0);

begin


MyStateMachine: statemachine port map ( Clk, Init, Din, Vend, C, Change_pulse, R); 
Result<=R;
Change<=C;

outRL: DisplayCkt port map (R(7 downto 4),ResultL);
outRR: DisplayCkt port map (R(3 downto 0),ResultR);
outCL: DisplayCkt port map (C(7 downto 4),ChangeL);
outCR: DisplayCkt port map (C(3 downto 0),ChangeR);
end behav;

