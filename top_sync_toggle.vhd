library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_sync_toggle is
    Port (
        clk  : in  STD_LOGIC;
        btnC : in  STD_LOGIC; -- Input asinkron
        led0 : out STD_LOGIC  -- Output led(0)
    );
end top_sync_toggle;

architecture Behavioral of top_sync_toggle is
    signal sync_out   : STD_LOGIC;
    signal sync_prev  : STD_LOGIC := '0';
    signal toggle_reg : STD_LOGIC := '0';
begin
    -- Instansiasi Synchronizer
    sync_inst: entity work.synchronizer_2ff
        port map (
            clk      => clk,
            async_in => btnC,
            sync_out => sync_out
        );

    process(clk)
    begin
        if rising_edge(clk) then
            sync_prev <= sync_out; -- Menyimpan nilai sebelumnya

            -- Deteksi transisi dari '0' ke '1' (Rising Edge)
            if (sync_out = '1' and sync_prev = '0') then
                toggle_reg <= not toggle_reg; -- Toggle LED
            end if;
        end if;
    end process;

    led0 <= toggle_reg;
end Behavioral;