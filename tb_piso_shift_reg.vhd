library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_piso_shift_reg is
end tb_piso_shift_reg;

architecture Behavioral of tb_piso_shift_reg is

    component piso_shift_reg
        Port (
            clk  : in  STD_LOGIC;
            rst  : in  STD_LOGIC;
            load : in  STD_LOGIC;
            d    : in  STD_LOGIC_VECTOR (7 downto 0);
            sout : out STD_LOGIC
        );
    end component;

    signal clk  : STD_LOGIC := '0';
    signal rst  : STD_LOGIC := '0';
    signal load : STD_LOGIC := '0';
    signal d    : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal sout : STD_LOGIC;

    constant CLK_PERIOD : time := 20 ns;

begin

    uut: piso_shift_reg
        Port Map (
            clk  => clk,
            rst  => rst,
            load => load,
            d    => d,
            sout => sout
        );

    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;

    stim_proc: process
    begin
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        
        -- Muat data paralel 10110011 (sw = "10110011")
        d <= "10110011";
        load <= '1';
        wait for 20 ns;

        -- Mulai pergeseran serial (load = '0')
        load <= '0';
        wait for 200 ns;

        wait;
    end process;

end Behavioral;