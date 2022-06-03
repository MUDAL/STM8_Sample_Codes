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
 487                     ; 77 static void Actuator_Init(actuator_t* actuator)
 487                     ; 78 {
 488                     	switch	.text
 489  0039               L722_Actuator_Init:
 491  0039 89            	pushw	x
 492       00000000      OFST:	set	0
 495                     ; 79 	GPIO_Init(actuator->port,actuator->pin,
 495                     ; 80 						GPIO_MODE_OUT_OD_LOW_FAST);
 497  003a 4ba0          	push	#160
 498  003c e602          	ld	a,(2,x)
 499  003e 88            	push	a
 500  003f fe            	ldw	x,(x)
 501  0040 cd0000        	call	_GPIO_Init
 503  0043 85            	popw	x
 504                     ; 81 	GPIO_WriteLow(actuator->port,actuator->pin);
 506  0044 1e01          	ldw	x,(OFST+1,sp)
 507  0046 e602          	ld	a,(2,x)
 508  0048 88            	push	a
 509  0049 1e02          	ldw	x,(OFST+2,sp)
 510  004b fe            	ldw	x,(x)
 511  004c cd0000        	call	_GPIO_WriteLow
 513  004f 84            	pop	a
 514                     ; 82 }
 517  0050 85            	popw	x
 518  0051 81            	ret
 575                     ; 84 static void Actuator_MultiInit(actuator_t* actuators[],
 575                     ; 85 														   uint8_t numOfActuators)
 575                     ; 86 {
 576                     	switch	.text
 577  0052               L762_Actuator_MultiInit:
 579  0052 89            	pushw	x
 580  0053 88            	push	a
 581       00000001      OFST:	set	1
 584                     ; 87 	uint8_t i = 0;
 586  0054 0f01          	clr	(OFST+0,sp)
 589  0056 200d          	jra	L523
 590  0058               L123:
 591                     ; 90 		Actuator_Init(actuators[i]);
 593  0058 7b01          	ld	a,(OFST+0,sp)
 594  005a 5f            	clrw	x
 595  005b 97            	ld	xl,a
 596  005c 58            	sllw	x
 597  005d 72fb02        	addw	x,(OFST+1,sp)
 598  0060 fe            	ldw	x,(x)
 599  0061 add6          	call	L722_Actuator_Init
 601                     ; 91 		i++;
 603  0063 0c01          	inc	(OFST+0,sp)
 605  0065               L523:
 606                     ; 88 	while(i < numOfActuators)
 608  0065 7b01          	ld	a,(OFST+0,sp)
 609  0067 1106          	cp	a,(OFST+5,sp)
 610  0069 25ed          	jrult	L123
 611                     ; 93 }
 614  006b 5b03          	addw	sp,#3
 615  006d 81            	ret
 684                     ; 95 static void Actuator_Write(actuator_t* actuator,
 684                     ; 96 													 actuatorState state)
 684                     ; 97 {
 685                     	switch	.text
 686  006e               L133_Actuator_Write:
 688  006e 89            	pushw	x
 689       00000000      OFST:	set	0
 692                     ; 98 	switch(state)
 694  006f 7b05          	ld	a,(OFST+5,sp)
 696                     ; 105 			break;
 697  0071 4d            	tnz	a
 698  0072 2705          	jreq	L333
 699  0074 4a            	dec	a
 700  0075 2710          	jreq	L533
 701  0077 201a          	jra	L573
 702  0079               L333:
 703                     ; 100 		case OFF:
 703                     ; 101 			GPIO_WriteLow(actuator->port,actuator->pin);
 705  0079 1e01          	ldw	x,(OFST+1,sp)
 706  007b e602          	ld	a,(2,x)
 707  007d 88            	push	a
 708  007e 1e02          	ldw	x,(OFST+2,sp)
 709  0080 fe            	ldw	x,(x)
 710  0081 cd0000        	call	_GPIO_WriteLow
 712  0084 84            	pop	a
 713                     ; 102 			break;
 715  0085 200c          	jra	L573
 716  0087               L533:
 717                     ; 103 		case ON:
 717                     ; 104 			GPIO_WriteHigh(actuator->port,actuator->pin);
 719  0087 1e01          	ldw	x,(OFST+1,sp)
 720  0089 e602          	ld	a,(2,x)
 721  008b 88            	push	a
 722  008c 1e02          	ldw	x,(OFST+2,sp)
 723  008e fe            	ldw	x,(x)
 724  008f cd0000        	call	_GPIO_WriteHigh
 726  0092 84            	pop	a
 727                     ; 105 			break;
 729  0093               L573:
 730                     ; 107 }
 733  0093 85            	popw	x
 734  0094 81            	ret
 771                     ; 109 static void ControlSoapFlow(sensor_t* sensor,
 771                     ; 110 														actuator_t* actuator)
 771                     ; 111 {
 772                     	switch	.text
 773  0095               L773_ControlSoapFlow:
 777                     ; 113 }
 780  0095 81            	ret
 832                     ; 115 static void ReadSensorDriveOutput(sensor_t* sensor,
 832                     ; 116 																	actuator_t* actuator)
 832                     ; 117 {
 833                     	switch	.text
 834  0096               L124_ReadSensorDriveOutput:
 836  0096 89            	pushw	x
 837       00000000      OFST:	set	0
 840                     ; 118 	if(Sensor_FoundObstacle(sensor))
 842  0097 ad8e          	call	L571_Sensor_FoundObstacle
 844  0099 4d            	tnz	a
 845  009a 2709          	jreq	L154
 846                     ; 120 		Actuator_Write(actuator,ON);
 848  009c 4b01          	push	#1
 849  009e 1e06          	ldw	x,(OFST+6,sp)
 850  00a0 adcc          	call	L133_Actuator_Write
 852  00a2 84            	pop	a
 854  00a3 2007          	jra	L354
 855  00a5               L154:
 856                     ; 124 		Actuator_Write(actuator,OFF);
 858  00a5 4b00          	push	#0
 859  00a7 1e06          	ldw	x,(OFST+6,sp)
 860  00a9 adc3          	call	L133_Actuator_Write
 862  00ab 84            	pop	a
 863  00ac               L354:
 864                     ; 126 }
 867  00ac 85            	popw	x
 868  00ad 81            	ret
 871                     .const:	section	.text
 872  0000               L554_soapSensor:
 873  0000 5005          	dc.w	20485
 874  0002 01            	dc.b	1
 875  0003               L754_fanSensor:
 876  0003 5005          	dc.w	20485
 877  0005 02            	dc.b	2
 878  0006               L164_waterSensor:
 879  0006 5005          	dc.w	20485
 880  0008 04            	dc.b	4
 881  0009               L364_sensors:
 882  0009 000000000000  	ds.b	6
 883  000f               L564_soapValve:
 884  000f 5005          	dc.w	20485
 885  0011 08            	dc.b	8
 886  0012               L764_fan:
 887  0012 5005          	dc.w	20485
 888  0014 10            	dc.b	16
 889  0015               L174_waterValve:
 890  0015 5005          	dc.w	20485
 891  0017 20            	dc.b	32
 892  0018               L374_led:
 893  0018 5019          	dc.w	20505
 894  001a 10            	dc.b	16
 895  001b               L574_actuators:
 896  001b 000000000000  	ds.b	8
1024                     ; 131 int main(void)
1024                     ; 132 {
1025                     	switch	.text
1026  00ae               _main:
1028  00ae 5223          	subw	sp,#35
1029       00000023      OFST:	set	35
1032                     ; 134 	sensor_t soapSensor = {GPIOB,GPIO_PIN_0};
1034  00b0 96            	ldw	x,sp
1035  00b1 1c0012        	addw	x,#OFST-17
1036  00b4 90ae0000      	ldw	y,#L554_soapSensor
1037  00b8 a603          	ld	a,#3
1038  00ba cd0000        	call	c_xymov
1040                     ; 135 	sensor_t fanSensor = {GPIOB,GPIO_PIN_1};
1042  00bd 96            	ldw	x,sp
1043  00be 1c0015        	addw	x,#OFST-14
1044  00c1 90ae0003      	ldw	y,#L754_fanSensor
1045  00c5 a603          	ld	a,#3
1046  00c7 cd0000        	call	c_xymov
1048                     ; 136 	sensor_t waterSensor = {GPIOB,GPIO_PIN_2};
1050  00ca 96            	ldw	x,sp
1051  00cb 1c0018        	addw	x,#OFST-11
1052  00ce 90ae0006      	ldw	y,#L164_waterSensor
1053  00d2 a603          	ld	a,#3
1054  00d4 cd0000        	call	c_xymov
1056                     ; 138 	sensor_t* sensors[NUM_SENSORS] = 
1056                     ; 139 	{&soapSensor,&fanSensor,&waterSensor};
1058  00d7 96            	ldw	x,sp
1059  00d8 1c0001        	addw	x,#OFST-34
1060  00db 90ae0009      	ldw	y,#L364_sensors
1061  00df a606          	ld	a,#6
1062  00e1 cd0000        	call	c_xymov
1064  00e4 96            	ldw	x,sp
1065  00e5 1c0012        	addw	x,#OFST-17
1066  00e8 1f01          	ldw	(OFST-34,sp),x
1068  00ea 96            	ldw	x,sp
1069  00eb 1c0015        	addw	x,#OFST-14
1070  00ee 1f03          	ldw	(OFST-32,sp),x
1072  00f0 96            	ldw	x,sp
1073  00f1 1c0018        	addw	x,#OFST-11
1074  00f4 1f05          	ldw	(OFST-30,sp),x
1076                     ; 142 	actuator_t soapValve = {GPIOB,GPIO_PIN_3};
1078  00f6 96            	ldw	x,sp
1079  00f7 1c001b        	addw	x,#OFST-8
1080  00fa 90ae000f      	ldw	y,#L564_soapValve
1081  00fe a603          	ld	a,#3
1082  0100 cd0000        	call	c_xymov
1084                     ; 143 	actuator_t fan = {GPIOB,GPIO_PIN_4};
1086  0103 96            	ldw	x,sp
1087  0104 1c001e        	addw	x,#OFST-5
1088  0107 90ae0012      	ldw	y,#L764_fan
1089  010b a603          	ld	a,#3
1090  010d cd0000        	call	c_xymov
1092                     ; 144 	actuator_t waterValve = {GPIOB,GPIO_PIN_5};
1094  0110 96            	ldw	x,sp
1095  0111 1c0021        	addw	x,#OFST-2
1096  0114 90ae0015      	ldw	y,#L174_waterValve
1097  0118 a603          	ld	a,#3
1098  011a cd0000        	call	c_xymov
1100                     ; 145 	actuator_t led = {GPIOF,GPIO_PIN_4};
1102  011d 96            	ldw	x,sp
1103  011e 1c0007        	addw	x,#OFST-28
1104  0121 90ae0018      	ldw	y,#L374_led
1105  0125 a603          	ld	a,#3
1106  0127 cd0000        	call	c_xymov
1108                     ; 147 	actuator_t* actuators[NUM_ACTUATORS] = 
1108                     ; 148 	{&soapValve,&fan,&waterValve,&led};
1110  012a 96            	ldw	x,sp
1111  012b 1c000a        	addw	x,#OFST-25
1112  012e 90ae001b      	ldw	y,#L574_actuators
1113  0132 a608          	ld	a,#8
1114  0134 cd0000        	call	c_xymov
1116  0137 96            	ldw	x,sp
1117  0138 1c001b        	addw	x,#OFST-8
1118  013b 1f0a          	ldw	(OFST-25,sp),x
1120  013d 96            	ldw	x,sp
1121  013e 1c001e        	addw	x,#OFST-5
1122  0141 1f0c          	ldw	(OFST-23,sp),x
1124  0143 96            	ldw	x,sp
1125  0144 1c0021        	addw	x,#OFST-2
1126  0147 1f0e          	ldw	(OFST-21,sp),x
1128  0149 96            	ldw	x,sp
1129  014a 1c0007        	addw	x,#OFST-28
1130  014d 1f10          	ldw	(OFST-19,sp),x
1132                     ; 151 	Sensor_MultiInit(sensors,NUM_SENSORS);
1134  014f 4b03          	push	#3
1135  0151 96            	ldw	x,sp
1136  0152 1c0002        	addw	x,#OFST-33
1137  0155 cd000b        	call	L331_Sensor_MultiInit
1139  0158 84            	pop	a
1140                     ; 152 	Actuator_MultiInit(actuators,NUM_ACTUATORS);
1142  0159 4b04          	push	#4
1143  015b 96            	ldw	x,sp
1144  015c 1c000b        	addw	x,#OFST-24
1145  015f cd0052        	call	L762_Actuator_MultiInit
1147  0162 84            	pop	a
1148                     ; 156 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);				 
1150  0163 4f            	clr	a
1151  0164 cd0000        	call	_CLK_HSIPrescalerConfig
1153                     ; 157 	TIM1_TimeBaseInit(128,TIM1_COUNTERMODE_UP,124,0);	
1155  0167 4b00          	push	#0
1156  0169 ae007c        	ldw	x,#124
1157  016c 89            	pushw	x
1158  016d 4b00          	push	#0
1159  016f ae0080        	ldw	x,#128
1160  0172 cd0000        	call	_TIM1_TimeBaseInit
1162  0175 5b04          	addw	sp,#4
1163                     ; 158 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
1165  0177 ae0101        	ldw	x,#257
1166  017a cd0000        	call	_TIM1_ITConfig
1168                     ; 159 	TIM1_Cmd(ENABLE);
1170  017d a601          	ld	a,#1
1171  017f cd0000        	call	_TIM1_Cmd
1173                     ; 161 	enableInterrupts();
1176  0182 9a            rim
1178  0183               L165:
1179                     ; 166 		ControlSoapFlow(&soapSensor,&soapValve);
1181  0183 96            	ldw	x,sp
1182  0184 1c001b        	addw	x,#OFST-8
1183  0187 89            	pushw	x
1184  0188 96            	ldw	x,sp
1185  0189 1c0014        	addw	x,#OFST-15
1186  018c cd0095        	call	L773_ControlSoapFlow
1188  018f 85            	popw	x
1189                     ; 168 		ReadSensorDriveOutput(&fanSensor,&fan);
1191  0190 96            	ldw	x,sp
1192  0191 1c001e        	addw	x,#OFST-5
1193  0194 89            	pushw	x
1194  0195 96            	ldw	x,sp
1195  0196 1c0017        	addw	x,#OFST-12
1196  0199 cd0096        	call	L124_ReadSensorDriveOutput
1198  019c 85            	popw	x
1199                     ; 169 		ReadSensorDriveOutput(&waterSensor,&waterValve);
1201  019d 96            	ldw	x,sp
1202  019e 1c0021        	addw	x,#OFST-2
1203  01a1 89            	pushw	x
1204  01a2 96            	ldw	x,sp
1205  01a3 1c001a        	addw	x,#OFST-9
1206  01a6 cd0096        	call	L124_ReadSensorDriveOutput
1208  01a9 85            	popw	x
1210  01aa 20d7          	jra	L165
1223                     	xdef	_main
1224                     	xref	_TIM1_ITConfig
1225                     	xref	_TIM1_Cmd
1226                     	xref	_TIM1_TimeBaseInit
1227                     	xref	_GPIO_ReadInputPin
1228                     	xref	_GPIO_WriteLow
1229                     	xref	_GPIO_WriteHigh
1230                     	xref	_GPIO_Init
1231                     	xref	_CLK_HSIPrescalerConfig
1232                     	xref.b	c_x
1251                     	xref	c_xymov
1252                     	end
