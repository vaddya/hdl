#include "system.h"
#include "altera_avalon_pio_regs.h"
#include <unistd.h>
#define NONE_PRESSED 0x1 // Value read from button PIO when no buttons pressed
#define DEBOUNCE 30000 // Time in microseconds to wait for switch debounce

int main(void)
{
	int buttons; // Use to hold button value
	int led = 0x00; // Use to write to led
	while (1) { // Read buttons via pio
		buttons = IORD_ALTERA_AVALON_PIO_DATA(BUTTONS_BASE);
		if (buttons != NONE_PRESSED) { // if button pressed
			if (led >= 0x80 || led==0x00)
				led = 0x01; // reset pattern
			else
				led = led << 1; // shift left on board (led0 is far right)
			IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE,~led); // Write new value to pio
			// Switch debounce routine
			usleep (DEBOUNCE);
			while (buttons != NONE_PRESSED) // wait for button release
			buttons = IORD_ALTERA_AVALON_PIO_DATA(BUTTONS_BASE);
			usleep (DEBOUNCE);
		}
	}
}
