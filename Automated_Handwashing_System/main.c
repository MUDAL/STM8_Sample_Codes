/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"

/**
	* @Author Olaoluwa Raji.
	* @Date 30-05-2022.
	* @Version 1.0.
	
	* @Description
	*	Automated Handwashing System (AHS).
	* The AHS consists of:
	* 1. A microcontroller.
	* 2. Proximity sensors.
	* 3. LED(s).
	* 4. Output devices (DC fan and two solenoid valves).
	* NB: One solenoid valve for water and another for soap.
	*
	* The STM8s microcontroller processes inputs from
	* the proximity sensors and drives the fan and solenoid
	* valves accordingly.
	
	* @IDE ST Visual Develop.
	* @Compiler STM8 Cosmic Compiler.
*/

int main(void)
{
	//Configure peripherals (I/O pins and Timer)
	while (1)
	{
		//Read sensor data and control output devices
		/* PLACE CODE HERE */
		
		//Time control for soap's solenoid valve
		/* PLACE CODE HERE */
	}
}