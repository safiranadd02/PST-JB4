library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_dff_sync_reset is
end tb_dff_sync_reset;

architecture Behavioral of tb_dff_sync_reset is

    -- Panggil modul utama dff_sync_reset
    component dff_sync_reset
        Port ( 
            clk : in  STD_LOGIC;
            rst : in  STD_LOGIC;
            d   : in  STD_LOGIC;
            q   : out STD_LOGIC
        );
    end component;

    -- Sinyal untuk simulasi
    signal clk : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '0';
    signal d   : STD_LOGIC := '0';
    signal q   : STD_LOGIC;

    constant CLK_PERIOD : time := 20 ns;

begin

    -- Hubungkan testbench ke modul dff_sync_reset
    uut: dff_sync_reset PORT MAP (
        clk => clk,
        rst => rst,
        d   => d,
        q   => q
    );

    -- Pembangkit clock 20 ns
    clk_process :process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Stimulus input
    stim_proc: process
    begin		
        rst <= '1';
        d   <= '0';
        wait for 40 ns;	
        
        rst <= '0';
        wait for 20 ns;

        d <= '1';
        wait for 40 ns;

        d <= '0';
        wait for 40 ns;

        d <= '1';
        wait for 20 ns;
        rst <= '1';
        wait for 40 ns;
        
        rst <= '0';
        wait;
    end process;

end Behavioral;