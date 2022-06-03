/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"
#include "stm8s_it.h"

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

//Pinouts
//Sensors
//1. soap = PB0
//2. fan = PB1
//3. water = PB2

//Actuators
//1. soap = PB3
//2. fan = PB4
//3. water = PB5
//4. LED = PF4


int main(void)
{
	//Variable(s)
	uint32_t soapDispensationTime = 10000; //10 secs default
	uint32_t soapValveShutOffTime = 60000; //1 minute default
	uint8_t soapFlowDisabled = 0;
	uint32_t currentTick = 0;
	
	disableInterrupts();
	//Initialize sensors
	GPIO_Init(SOAP_SENSOR_PORT,SOAP_SENSOR,SENSOR_INIT);
	GPIO_Init(FAN_SENSOR_PORT,FAN_SENSOR,SENSOR_INIT);
	GPIO_Init(WATER_SENSOR_PORT,WATER_SENSOR,SENSOR_INIT);
	//Initialize actuators
	GPIO_Init(SOAP_VALVE_PORT,SOAP_VALVE,OUTPUT_INIT);
	GPIO_Init(FAN_PORT,FAN,OUTPUT_INIT);
	GPIO_Init(WATER_VALVE_PORT,WATER_VALVE,OUTPUT_INIT);
	GPIO_Init(LED_PORT,LED,OUTPUT_INIT);
	//Turn all actuators off
	GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
	GPIO_WriteLow(FAN_PORT,FAN);
	GPIO_WriteLow(WATER_VALVE_PORT,WATER_VALVE);
	GPIO_WriteLow(LED_PORT,LED);
	
	//Initialize timers
	//Timer 1 for creating delays (1ms timebase)
	//Clock = 16MHz, Prescaler = 128, Timer period = 124
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);				 
	TIM1_TimeBaseInit(128,TIM1_COUNTERMODE_UP,124,0);	
	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
	TIM1_Cmd(ENABLE);
	//Timer 2 to periodically poll functions (1ms timebase)
	//Clock = 16MHz, Prescaler = 128, Period = 124
	TIM2_TimeBaseInit(128,124);
	TIM2_ITConfig(TIM2_IT_UPDATE,ENABLE);
	TIM2_Cmd(ENABLE);
	
	enableInterrupts();
	
	while (1)
	{
		//Handle soap sensor, valve and timing
		if(!soapFlowDisabled)
		{
			if(!GPIO_ReadInputPin(SOAP_SENSOR_PORT,SOAP_SENSOR))
			{
				GPIO_WriteHigh(SOAP_VALVE_PORT,SOAP_VALVE);
				DelayMs(soapDispensationTime);
				GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
				ToggleLED();
				soapFlowDisabled = 1;
				currentTick = GetTick();
			}
			else
			{
				GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
			}
		}
		else
		{
			if((GetTick() - currentTick) >= soapValveShutOffTime)
			{
				DisableLED();
				soapFlowDisabled = 0;
			}
		}									 
	}
}