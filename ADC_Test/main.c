/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"

//Simple ADC test (potentiometer)

 uint16_t adcValue = 0;

int main(void)
{
	//ADC Initialization
	GPIO_Init(GPIOB,GPIO_PIN_5,GPIO_MODE_IN_FL_NO_IT);
	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_5, ADC1_PRESSEL_FCPU_D2, 
					  ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL5,
						DISABLE);
	ADC1_StartConversion();
	while(1)
	{
		//If conversion is complete, read ADC value
		if(ADC1_GetFlagStatus(ADC1_FLAG_EOC))
		{
			adcValue = ADC1_GetConversionValue();
			ADC1_ClearFlag(ADC1_FLAG_EOC);
		}
	}
}