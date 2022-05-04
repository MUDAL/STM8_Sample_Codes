/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"

//The LED connected to PE5 uses inverse logic i.e.
//writing a high will turn it off and vice versa

int main(void)
{
	//PE5 as output and PF4 as input 
	GPIO_Init(GPIOE,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOF,GPIO_PIN_4,GPIO_MODE_IN_PU_NO_IT);
	while(1)
	{
		//If Button PF4 is pressed, turn LED PE5 on
		if(!GPIO_ReadInputPin(GPIOF,GPIO_PIN_4))
		{
			GPIO_WriteLow(GPIOE,GPIO_PIN_5); 
		}
		else
		{
			GPIO_WriteHigh(GPIOE,GPIO_PIN_5);
		}
	}
}