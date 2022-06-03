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

#define NUM_SENSORS			3
#define NUM_ACTUATORS		4

//Exported function(s)
//from stm8s_it.c
void DelayMs(uint32_t delay);
uint32_t GetTick(void);

//Sensor
typedef struct
{
	GPIO_TypeDef* port;
	GPIO_Pin_TypeDef pin;
}sensor_t;

static void Sensor_Init(sensor_t* sensor)
{
	GPIO_Init(sensor->port,sensor->pin,GPIO_MODE_IN_PU_IT);
}

static void Sensor_MultiInit(sensor_t* sensors[],
														 uint8_t numOfSensors)
{
	uint8_t i = 0;
	while(i < numOfSensors)
	{
		Sensor_Init(sensors[i]);
		i++;
	}
}

//Return true if sensor detects an obstacle.... 
//and false if otherwise
static bool Sensor_FoundObstacle(sensor_t* sensor)
{
	return !GPIO_ReadInputPin(sensor->port,
														sensor->pin);
}

//Actuator
typedef enum 
{
	OFF = 0,
	ON
}actuatorState;

typedef struct
{
	GPIO_TypeDef* port;
	GPIO_Pin_TypeDef pin;	
}actuator_t;

static void Actuator_Init(actuator_t* actuator)
{
	GPIO_Init(actuator->port,actuator->pin,
						GPIO_MODE_OUT_OD_LOW_FAST);
	GPIO_WriteLow(actuator->port,actuator->pin);
}

static void Actuator_MultiInit(actuator_t* actuators[],
														   uint8_t numOfActuators)
{
	uint8_t i = 0;
	while(i < numOfActuators)
	{
		Actuator_Init(actuators[i]);
		i++;
	}
}

static void Actuator_Write(actuator_t* actuator,
													 actuatorState state)
{
	switch(state)
	{
		case OFF:
			GPIO_WriteLow(actuator->port,actuator->pin);
			break;
		case ON:
			GPIO_WriteHigh(actuator->port,actuator->pin);
			break;
	}
}

static void ControlTimedOutput(sensor_t* sensor,
														   actuator_t* actuator,
															 uint32_t actuationTime,
															 uint32_t shutOffTime)
{
	static uint8_t sensorDeactivated;
	static uint32_t currentTick;
		
	if(!sensorDeactivated)
	{
		if(Sensor_FoundObstacle(sensor))
		{
			Actuator_Write(actuator,ON);
			DelayMs(actuationTime);
			Actuator_Write(actuator,OFF);
			sensorDeactivated = 1;
			currentTick = GetTick();
		}
		else
		{
			Actuator_Write(actuator,OFF);
		}
	}
	else
	{
		if((GetTick() - currentTick) >= shutOffTime)
		{
			sensorDeactivated = 0;
		}
	}
}

static void ReadSensorDriveOutput(sensor_t* sensor,
																	actuator_t* actuator)
{
	if(Sensor_FoundObstacle(sensor))
	{
		Actuator_Write(actuator,ON);
	}
	else
	{
		Actuator_Write(actuator,OFF);
	}	
}

int main(void)
{
	//Variable(s)
	uint32_t soapDispensationTime = 10000; //10 secs
	uint32_t soapValveShutOffTime = 60000; //1 minute
	//Sensor(s)
	sensor_t soapSensor = {GPIOB,GPIO_PIN_0};
	sensor_t fanSensor = {GPIOB,GPIO_PIN_1};
	sensor_t waterSensor = {GPIOB,GPIO_PIN_2};
	
	sensor_t* sensors[NUM_SENSORS] = 
	{&soapSensor,&fanSensor,&waterSensor};
	
	//Actuator(s)
	actuator_t soapValve = {GPIOB,GPIO_PIN_3};
	actuator_t fan = {GPIOB,GPIO_PIN_4};
	actuator_t waterValve = {GPIOB,GPIO_PIN_5};
	actuator_t led = {GPIOF,GPIO_PIN_4};
	
	actuator_t* actuators[NUM_ACTUATORS] = 
	{&soapValve,&fan,&waterValve,&led};
																	
	//Initialize sensors and actuators
	Sensor_MultiInit(sensors,NUM_SENSORS);
	Actuator_MultiInit(actuators,NUM_ACTUATORS);
	
	//Initialize timer
	//Clock = 16MHz, Prescaler = 128, Timer period = 124
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);				 
	TIM1_TimeBaseInit(128,TIM1_COUNTERMODE_UP,124,0);	
	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
	TIM1_Cmd(ENABLE);
	
	enableInterrupts();
	
	while (1)
	{
		//Read soap sensor, dispense soap, start timer
		ControlTimedOutput(&soapSensor,&soapValve,
											 soapDispensationTime,
											 soapValveShutOffTime);
		//Read other sensors and drive their actuators
		ReadSensorDriveOutput(&fanSensor,&fan);
		ReadSensorDriveOutput(&waterSensor,&waterValve);
	}
}