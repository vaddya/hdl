#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "system.h"
#include <stdio.h>
#include <unistd.h>
static int count;
int main(void)
{
	count = 255;
	while( 1 )
	{
		usleep(500000);
		IOWR_ALTERA_AVALON_PIO_DATA( PIO_BASE, ~count );
		count++; /* Continue 0-ff counting loop. */
	}
	return 0;
}
