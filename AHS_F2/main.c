/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"
#include "stm8s_it.h"

/**
	* @Author Olaoluwa Raji.
	* @Date 16-06-2022.
	* @Version 1.1 
	* (Active low control for water valve)
	
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
	* The actuation of the valve for soap dispensation is 
	* controlled using a timer in order to prevent wastage of
	* soap.
	
	* @IDE ST Visual Develop.
	* @Compiler STM8 Cosmic Compiler.
*/

//Sensor pinout
//1. Soap sensor = PB0
//2. Fan sensor = PB1
//3. Water sensor = PB2

//Actuator pinout
//1. Soap valve = PD2
//2. Fan = PD3
//3. Water valve = PD4
//4. Soap LED = PF4
//5. Power LED = PB4

int main(void)
{
	//Variable(s)
	uint32_t soapDispensationTime = 10000; //10 secs default
	uint32_t soapValveShutOffTime = 60000; //1 minute default
	uint8_t soapFlowDisabled = 0;
	uint8_t soapDispenseStarted = 0;
	uint8_t soapValveShutOff = 0;
	uint8_t firstTickMeasured = 0;
	uint32_t currTick = 0; //current tick
	
	disableInterrupts();
	//Clock configuration, 16MHz
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	//Initialize sensors
	GPIO_Init(SOAP_SENSOR_PORT,SOAP_SENSOR,SENSOR_INIT);
	GPIO_Init(FAN_SENSOR_PORT,FAN_SENSOR,SENSOR_INIT);
	GPIO_Init(WATER_SENSOR_PORT,WATER_SENSOR,SENSOR_INIT);
	//Initialize actuators
	GPIO_Init(SOAP_VALVE_PORT,SOAP_VALVE,OUTPUT_INIT);
	GPIO_Init(FAN_PORT,FAN,OUTPUT_INIT);
	GPIO_Init(WATER_VALVE_PORT,WATER_VALVE,OUTPUT_INIT);
	GPIO_Init(SOAP_LED_PORT,SOAP_LED,OUTPUT_INIT);
	GPIO_Init(POWER_LED_PORT,POWER_LED,OUTPUT_INIT);
	//Turn all actuators off
	GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
	GPIO_WriteLow(FAN_PORT,FAN);
	GPIO_WriteHigh(WATER_VALVE_PORT,WATER_VALVE); //Active low
	GPIO_WriteLow(SOAP_LED_PORT,SOAP_LED);
	//Initialize timers
	//Timer 1 for creating delays (1ms timebase)
	//Prescaler = 128, Timer period = 124
	TIM1_TimeBaseInit(128,TIM1_COUNTERMODE_UP,124,0);	
	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
	TIM1_Cmd(ENABLE);
	//Timer 2 to periodically poll functions (10ms timebase)
	//Prescaler = 128, Period = 1249
	TIM2_TimeBaseInit(TIM2_PRESCALER_128,1249);
	TIM2_ITConfig(TIM2_IT_UPDATE,ENABLE);
	TIM2_Cmd(ENABLE);

	enableInterrupts();
	//Indicate power on
	GPIO_WriteHigh(POWER_LED_PORT,POWER_LED);
	DelayMs(3000);
	GPIO_WriteLow(POWER_LED_PORT,POWER_LED);
	
	while (1)
	{
		//Read soap sensor and actuate soap valve 
		if(!GPIO_ReadInputPin(SOAP_SENSOR_PORT,SOAP_SENSOR))
		{
			if(!soapFlowDisabled)
			{
				GPIO_WriteHigh(SOAP_VALVE_PORT,SOAP_VALVE);
				soapDispenseStarted = 1;
				if(!firstTickMeasured)
				{
					currTick = GetTick();
					firstTickMeasured = 1;
				}
			}
		}
		else
		{
			GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
		}
		//If soap dispensation time has elapsed, shut-off ..
		//the soap valve and start blinking LED
		if(soapDispenseStarted)
		{
			if((GetTick() - currTick) >= soapDispensationTime)
			{
				GPIO_WriteLow(SOAP_VALVE_PORT,SOAP_VALVE);
				soapFlowDisabled = 1;
				soapValveShutOff = 1;
				soapDispenseStarted = 0;
				currTick = GetTick();
				StartTogglingLED();
			}
		}
		//If valve shut off time has elapsed, restore ....
		//soap valve and sensor
		if(soapValveShutOff)
		{
			if((GetTick() - currTick) >= soapValveShutOffTime)
			{
				soapValveShutOff = 0;
				soapFlowDisabled = 0;
				firstTickMeasured = 0;
				StopTogglingLED();
			}
		}
	}
}