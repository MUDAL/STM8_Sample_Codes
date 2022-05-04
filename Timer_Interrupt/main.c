/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"

//Blinking onboard LED (PE5) using timer-created delays [Interrupt version]
//Constants for 1ms time-base (@16MHz clock)
#define PRESCALER_128		128
#define LOAD_VALUE			124
//Exported function(s)
void TIM1_Delay(uint32_t delayMs);

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
	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
	enableInterrupts();
	TIM1_Cmd(ENABLE);
	
	while(1)
	{
		GPIO_WriteReverse(GPIOE,GPIO_PIN_5);
		TIM1_Delay(1000);
	}
}