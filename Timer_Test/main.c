/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"

//Blinking onboard LED (PE5) using timer-created delays
//Constants for 1ms time-base (@16MHz clock)
#define PRESCALER_128		128
#define LOAD_VALUE			124

uint32_t nCount = 0;

int main(void)
{
	//PE5 as output
	GPIO_Init(GPIOE,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_FAST); 
	//Timer configuration
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); //16MHz clock
	TIM1_TimeBaseInit(PRESCALER_128,
										TIM1_COUNTERMODE_UP,
									  LOAD_VALUE,
										0);
	TIM1_Cmd(ENABLE);
	while(1)
	{
		if(TIM1_GetFlagStatus(TIM1_FLAG_UPDATE))
		{
			TIM1_ClearFlag(TIM1_FLAG_UPDATE);
			if((nCount % 400) == 0)
			{//Toggle PE5 every 400ms
				GPIO_WriteReverse(GPIOE,GPIO_PIN_5);
			}
			nCount++;
		}
	}
}