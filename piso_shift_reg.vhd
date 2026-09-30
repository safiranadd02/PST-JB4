library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity piso_shift_reg is
    Port ( 
        clk  : in  STD_LOGIC;
        rst  : in  STD_LOGIC;
        load : in  STD_LOGIC;                      -- Di-map ke tombol (misal: btnC)
        d    : in  STD_LOGIC_VECTOR (7 downto 0);  -- Di-map ke sw(7 downto 0)
        sout : out STD_LOGIC                       -- Di-map ke led(0)
    );
end piso_shift_reg;

architecture Behavioral of piso_shift_reg is
    signal shift_reg : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                shift_reg <= (others => '0');
            elsif load = '1' then
                shift_reg <= d; -- Muat data 8-bit secara paralel
            else
                -- Geser data ke kiri (MSB dikeluarkannya, LSB diisi '0')
                shift_reg <= shift_reg(6 downto 0) & '0';
            end if;
        end if;
    end process;

    -- Bit paling kiri (MSB) dihubungkan ke output serial sout
    sout <= shift_reg(7);

end Behavioral;