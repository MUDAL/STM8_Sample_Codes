   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
 220                     ; 40 static void Sensor_Init(sensor_t* sensor)
 220                     ; 41 {
 222                     	switch	.text
 223  0000               L3_Sensor_Init:
 227                     ; 42 	GPIO_Init(sensor->port,sensor->pin,GPIO_MODE_IN_PU_IT);
 229  0000 4b60          	push	#96
 230  0002 e602          	ld	a,(2,x)
 231  0004 88            	push	a
 232  0005 fe            	ldw	x,(x)
 233  0006 cd0000        	call	_GPIO_Init
 235  0009 85            	popw	x
 236                     ; 43 }
 239  000a 81            	ret
 296                     ; 45 static void Sensor_MultiInit(sensor_t* sensors[],
 296                     ; 46 														 uint8_t numOfSensors)
 296                     ; 47 {
 297                     	switch	.text
 298  000b               L331_Sensor_MultiInit:
 300  000b 89            	pushw	x
 301  000c 88            	push	a
 302       00000001      OFST:	set	1
 305                     ; 48 	uint8_t i = 0;
 307  000d 0f01          	clr	(OFST+0,sp)
 310  000f 200d          	jra	L171
 311  0011               L561:
 312                     ; 51 		Sensor_Init(sensors[i]);
 314  0011 7b01          	ld	a,(OFST+0,sp)
 315  0013 5f            	clrw	x
 316  0014 97            	ld	xl,a
 317  0015 58            	sllw	x
 318  0016 72fb02        	addw	x,(OFST+1,sp)
 319  0019 fe            	ldw	x,(x)
 320  001a ade4          	call	L3_Sensor_Init
 322                     ; 52 		i++;
 324  001c 0c01          	inc	(OFST+0,sp)
 326  001e               L171:
 327                     ; 49 	while(i < numOfSensors)
 329  001e 7b01          	ld	a,(OFST+0,sp)
 330  0020 1106          	cp	a,(OFST+5,sp)
 331  0022 25ed          	jrult	L561
 332                     ; 54 }
 335  0024 5b03          	addw	sp,#3
 336  0026 81            	ret
 396                     ; 58 static bool Sensor_FoundObstacle(sensor_t* sensor)
 396                     ; 59 {
 397                     	switch	.text
 398  0027               L571_Sensor_FoundObstacle:
 402                     ; 60 	return !GPIO_ReadInputPin(sensor->port,
 402                     ; 61 														sensor->pin);
 404  0027 e602          	ld	a,(2,x)
 405  0029 88            	push	a
 406  002a fe            	ldw	x,(x)
 407  002b cd0000        	call	_GPIO_ReadInputPin
 409  002e 5b01          	addw	sp,#1
 410  0030 4d            	tnz	a
 411  0031 2604          	jrne	L21
 412  0033 a601          	ld	a,#1
 413  0035 2001          	jra	L41
 414  0037               L21:
 415  0037 4f            	clr	a
 416  0038               L41:
 419  0038 81            	ret
 486                     ; 77 static void Actuator_Init(actuator_t* actuator)
 486                     ; 78 {
 487                     	switch	.text
 488  0039               L722_Actuator_Init:
 492                     ; 79 	GPIO_Init(actuator->port,actuator->pin,
 492                     ; 80 						GPIO_MODE_OUT_OD_LOW_FAST);
 494  0039 4ba0          	push	#160
 495  003b e602          	ld	a,(2,x)
 496  003d 88            	push	a
 497  003e fe            	ldw	x,(x)
 498  003f cd0000        	call	_GPIO_Init
 500  0042 85            	popw	x
 501                     ; 81 }
 504  0043 81            	ret
 561                     ; 83 static void Actuator_MultiInit(actuator_t* actuators[],
 561                     ; 84 														   uint8_t numOfActuators)
 561                     ; 85 {
 562                     	switch	.text
 563  0044               L762_Actuator_MultiInit:
 565  0044 89            	pushw	x
 566  0045 88            	push	a
 567       00000001      OFST:	set	1
 570                     ; 86 	uint8_t i = 0;
 572  0046 0f01          	clr	(OFST+0,sp)
 575  0048 200d          	jra	L523
 576  004a               L123:
 577                     ; 89 		Actuator_Init(actuators[i]);
 579  004a 7b01          	ld	a,(OFST+0,sp)
 580  004c 5f            	clrw	x
 581  004d 97            	ld	xl,a
 582  004e 58            	sllw	x
 583  004f 72fb02        	addw	x,(OFST+1,sp)
 584  0052 fe            	ldw	x,(x)
 585  0053 ade4          	call	L722_Actuator_Init
 587                     ; 90 		i++;
 589  0055 0c01          	inc	(OFST+0,sp)
 591  0057               L523:
 592                     ; 87 	while(i < numOfActuators)
 594  0057 7b01          	ld	a,(OFST+0,sp)
 595  0059 1106          	cp	a,(OFST+5,sp)
 596  005b 25ed          	jrult	L123
 597                     ; 92 }
 600  005d 5b03          	addw	sp,#3
 601  005f 81            	ret
 670                     ; 94 static void Actuator_Write(actuator_t* actuator,
 670                     ; 95 													 actuatorState state)
 670                     ; 96 {
 671                     	switch	.text
 672  0060               L133_Actuator_Write:
 674  0060 89            	pushw	x
 675       00000000      OFST:	set	0
 678                     ; 97 	switch(state)
 680  0061 7b05          	ld	a,(OFST+5,sp)
 682                     ; 104 			break;
 683  0063 4d            	tnz	a
 684  0064 2705          	jreq	L333
 685  0066 4a            	dec	a
 686  0067 2710          	jreq	L533
 687  0069 201a          	jra	L573
 688  006b               L333:
 689                     ; 99 		case OFF:
 689                     ; 100 			GPIO_WriteLow(actuator->port,actuator->pin);
 691  006b 1e01          	ldw	x,(OFST+1,sp)
 692  006d e602          	ld	a,(2,x)
 693  006f 88            	push	a
 694  0070 1e02          	ldw	x,(OFST+2,sp)
 695  0072 fe            	ldw	x,(x)
 696  0073 cd0000        	call	_GPIO_WriteLow
 698  0076 84            	pop	a
 699                     ; 101 			break;
 701  0077 200c          	jra	L573
 702  0079               L533:
 703                     ; 102 		case ON:
 703                     ; 103 			GPIO_WriteHigh(actuator->port,actuator->pin);
 705  0079 1e01          	ldw	x,(OFST+1,sp)
 706  007b e602          	ld	a,(2,x)
 707  007d 88            	push	a
 708  007e 1e02          	ldw	x,(OFST+2,sp)
 709  0080 fe            	ldw	x,(x)
 710  0081 cd0000        	call	_GPIO_WriteHigh
 712  0084 84            	pop	a
 713                     ; 104 			break;
 715  0085               L573:
 716                     ; 106 }
 719  0085 85            	popw	x
 720  0086 81            	ret
 757                     ; 108 static void TimedOutputControl(sensor_t* sensor,
 757                     ; 109 															 actuator_t* actuator)
 757                     ; 110 {
 758                     	switch	.text
 759  0087               L773_TimedOutputControl:
 763                     ; 112 }
 766  0087 81            	ret
 818                     ; 114 static void ReadSensorDriveOutput(sensor_t* sensor,
 818                     ; 115 																	actuator_t* actuator)
 818                     ; 116 {
 819                     	switch	.text
 820  0088               L124_ReadSensorDriveOutput:
 822  0088 89            	pushw	x
 823       00000000      OFST:	set	0
 826                     ; 117 	if(Sensor_FoundObstacle(sensor))
 828  0089 ad9c          	call	L571_Sensor_FoundObstacle
 830  008b 4d            	tnz	a
 831  008c 2709          	jreq	L154
 832                     ; 119 		Actuator_Write(actuator,ON);
 834  008e 4b01          	push	#1
 835  0090 1e06          	ldw	x,(OFST+6,sp)
 836  0092 adcc          	call	L133_Actuator_Write
 838  0094 84            	pop	a
 840  0095 2007          	jra	L354
 841  0097               L154:
 842                     ; 123 		Actuator_Write(actuator,OFF);
 844  0097 4b00          	push	#0
 845  0099 1e06          	ldw	x,(OFST+6,sp)
 846  009b adc3          	call	L133_Actuator_Write
 848  009d 84            	pop	a
 849  009e               L354:
 850                     ; 125 }
 853  009e 85            	popw	x
 854  009f 81            	ret
 857                     .const:	section	.text
 858  0000               L554_soapSensor:
 859  0000 5005          	dc.w	20485
 860  0002 01            	dc.b	1
 861  0003               L754_fanSensor:
 862  0003 5005          	dc.w	20485
 863  0005 02            	dc.b	2
 864  0006               L164_waterSensor:
 865  0006 5005          	dc.w	20485
 866  0008 04            	dc.b	4
 867  0009               L364_sensors:
 868  0009 000000000000  	ds.b	6
 869  000f               L564_soapValve:
 870  000f 5005          	dc.w	20485
 871  0011 08            	dc.b	8
 872  0012               L764_fan:
 873  0012 5005          	dc.w	20485
 874  0014 10            	dc.b	16
 875  0015               L174_waterValve:
 876  0015 5005          	dc.w	20485
 877  0017 20            	dc.b	32
 878  0018               L374_led:
 879  0018 5019          	dc.w	20505
 880  001a 10            	dc.b	16
 881  001b               L574_actuators:
 882  001b 000000000000  	ds.b	8
1005                     ; 127 int main(void)
1005                     ; 128 {
1006                     	switch	.text
1007  00a0               _main:
1009  00a0 5223          	subw	sp,#35
1010       00000023      OFST:	set	35
1013                     ; 130 	sensor_t soapSensor = {GPIOB,GPIO_PIN_0};
1015  00a2 96            	ldw	x,sp
1016  00a3 1c0012        	addw	x,#OFST-17
1017  00a6 90ae0000      	ldw	y,#L554_soapSensor
1018  00aa a603          	ld	a,#3
1019  00ac cd0000        	call	c_xymov
1021                     ; 131 	sensor_t fanSensor = {GPIOB,GPIO_PIN_1};
1023  00af 96            	ldw	x,sp
1024  00b0 1c0015        	addw	x,#OFST-14
1025  00b3 90ae0003      	ldw	y,#L754_fanSensor
1026  00b7 a603          	ld	a,#3
1027  00b9 cd0000        	call	c_xymov
1029                     ; 132 	sensor_t waterSensor = {GPIOB,GPIO_PIN_2};
1031  00bc 96            	ldw	x,sp
1032  00bd 1c0018        	addw	x,#OFST-11
1033  00c0 90ae0006      	ldw	y,#L164_waterSensor
1034  00c4 a603          	ld	a,#3
1035  00c6 cd0000        	call	c_xymov
1037                     ; 134 	sensor_t* sensors[NUM_SENSORS] = 
1037                     ; 135 	{&soapSensor,&fanSensor,&waterSensor};
1039  00c9 96            	ldw	x,sp
1040  00ca 1c0001        	addw	x,#OFST-34
1041  00cd 90ae0009      	ldw	y,#L364_sensors
1042  00d1 a606          	ld	a,#6
1043  00d3 cd0000        	call	c_xymov
1045  00d6 96            	ldw	x,sp
1046  00d7 1c0012        	addw	x,#OFST-17
1047  00da 1f01          	ldw	(OFST-34,sp),x
1049  00dc 96            	ldw	x,sp
1050  00dd 1c0015        	addw	x,#OFST-14
1051  00e0 1f03          	ldw	(OFST-32,sp),x
1053  00e2 96            	ldw	x,sp
1054  00e3 1c0018        	addw	x,#OFST-11
1055  00e6 1f05          	ldw	(OFST-30,sp),x
1057                     ; 138 	actuator_t soapValve = {GPIOB,GPIO_PIN_3};
1059  00e8 96            	ldw	x,sp
1060  00e9 1c001b        	addw	x,#OFST-8
1061  00ec 90ae000f      	ldw	y,#L564_soapValve
1062  00f0 a603          	ld	a,#3
1063  00f2 cd0000        	call	c_xymov
1065                     ; 139 	actuator_t fan = {GPIOB,GPIO_PIN_4};
1067  00f5 96            	ldw	x,sp
1068  00f6 1c001e        	addw	x,#OFST-5
1069  00f9 90ae0012      	ldw	y,#L764_fan
1070  00fd a603          	ld	a,#3
1071  00ff cd0000        	call	c_xymov
1073                     ; 140 	actuator_t waterValve = {GPIOB,GPIO_PIN_5};
1075  0102 96            	ldw	x,sp
1076  0103 1c0021        	addw	x,#OFST-2
1077  0106 90ae0015      	ldw	y,#L174_waterValve
1078  010a a603          	ld	a,#3
1079  010c cd0000        	call	c_xymov
1081                     ; 141 	actuator_t led = {GPIOF,GPIO_PIN_4};
1083  010f 96            	ldw	x,sp
1084  0110 1c0007        	addw	x,#OFST-28
1085  0113 90ae0018      	ldw	y,#L374_led
1086  0117 a603          	ld	a,#3
1087  0119 cd0000        	call	c_xymov
1089                     ; 143 	actuator_t* actuators[NUM_ACTUATORS] = 
1089                     ; 144 	{&soapValve,&fan,&waterValve,&led};
1091  011c 96            	ldw	x,sp
1092  011d 1c000a        	addw	x,#OFST-25
1093  0120 90ae001b      	ldw	y,#L574_actuators
1094  0124 a608          	ld	a,#8
1095  0126 cd0000        	call	c_xymov
1097  0129 96            	ldw	x,sp
1098  012a 1c001b        	addw	x,#OFST-8
1099  012d 1f0a          	ldw	(OFST-25,sp),x
1101  012f 96            	ldw	x,sp
1102  0130 1c001e        	addw	x,#OFST-5
1103  0133 1f0c          	ldw	(OFST-23,sp),x
1105  0135 96            	ldw	x,sp
1106  0136 1c0021        	addw	x,#OFST-2
1107  0139 1f0e          	ldw	(OFST-21,sp),x
1109  013b 96            	ldw	x,sp
1110  013c 1c0007        	addw	x,#OFST-28
1111  013f 1f10          	ldw	(OFST-19,sp),x
1113                     ; 147 	Sensor_MultiInit(sensors,NUM_SENSORS);
1115  0141 4b03          	push	#3
1116  0143 96            	ldw	x,sp
1117  0144 1c0002        	addw	x,#OFST-33
1118  0147 cd000b        	call	L331_Sensor_MultiInit
1120  014a 84            	pop	a
1121                     ; 148 	Actuator_MultiInit(actuators,NUM_ACTUATORS);
1123  014b 4b04          	push	#4
1124  014d 96            	ldw	x,sp
1125  014e 1c000b        	addw	x,#OFST-24
1126  0151 cd0044        	call	L762_Actuator_MultiInit
1128  0154 84            	pop	a
1129  0155               L165:
1130                     ; 153 		TimedOutputControl(&soapSensor,&soapValve);
1132  0155 96            	ldw	x,sp
1133  0156 1c001b        	addw	x,#OFST-8
1134  0159 89            	pushw	x
1135  015a 96            	ldw	x,sp
1136  015b 1c0014        	addw	x,#OFST-15
1137  015e cd0087        	call	L773_TimedOutputControl
1139  0161 85            	popw	x
1140                     ; 155 		ReadSensorDriveOutput(&fanSensor,&fan);
1142  0162 96            	ldw	x,sp
1143  0163 1c001e        	addw	x,#OFST-5
1144  0166 89            	pushw	x
1145  0167 96            	ldw	x,sp
1146  0168 1c0017        	addw	x,#OFST-12
1147  016b cd0088        	call	L124_ReadSensorDriveOutput
1149  016e 85            	popw	x
1150                     ; 156 		ReadSensorDriveOutput(&waterSensor,&waterValve);
1152  016f 96            	ldw	x,sp
1153  0170 1c0021        	addw	x,#OFST-2
1154  0173 89            	pushw	x
1155  0174 96            	ldw	x,sp
1156  0175 1c001a        	addw	x,#OFST-9
1157  0178 cd0088        	call	L124_ReadSensorDriveOutput
1159  017b 85            	popw	x
1161  017c 20d7          	jra	L165
1174                     	xdef	_main
1175                     	xref	_GPIO_ReadInputPin
1176                     	xref	_GPIO_WriteLow
1177                     	xref	_GPIO_WriteHigh
1178                     	xref	_GPIO_Init
1179                     	xref.b	c_x
1198                     	xref	c_xymov
1199                     	end
