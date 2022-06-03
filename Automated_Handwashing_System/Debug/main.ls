   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
 220                     ; 45 static void Sensor_Init(sensor_t* sensor)
 220                     ; 46 {
 222                     	switch	.text
 223  0000               L3_Sensor_Init:
 227                     ; 47 	GPIO_Init(sensor->port,sensor->pin,GPIO_MODE_IN_PU_IT);
 229  0000 4b60          	push	#96
 230  0002 e602          	ld	a,(2,x)
 231  0004 88            	push	a
 232  0005 fe            	ldw	x,(x)
 233  0006 cd0000        	call	_GPIO_Init
 235  0009 85            	popw	x
 236                     ; 48 }
 239  000a 81            	ret
 296                     ; 50 static void Sensor_MultiInit(sensor_t* sensors[],
 296                     ; 51 														 uint8_t numOfSensors)
 296                     ; 52 {
 297                     	switch	.text
 298  000b               L331_Sensor_MultiInit:
 300  000b 89            	pushw	x
 301  000c 88            	push	a
 302       00000001      OFST:	set	1
 305                     ; 53 	uint8_t i = 0;
 307  000d 0f01          	clr	(OFST+0,sp)
 310  000f 200d          	jra	L171
 311  0011               L561:
 312                     ; 56 		Sensor_Init(sensors[i]);
 314  0011 7b01          	ld	a,(OFST+0,sp)
 315  0013 5f            	clrw	x
 316  0014 97            	ld	xl,a
 317  0015 58            	sllw	x
 318  0016 72fb02        	addw	x,(OFST+1,sp)
 319  0019 fe            	ldw	x,(x)
 320  001a ade4          	call	L3_Sensor_Init
 322                     ; 57 		i++;
 324  001c 0c01          	inc	(OFST+0,sp)
 326  001e               L171:
 327                     ; 54 	while(i < numOfSensors)
 329  001e 7b01          	ld	a,(OFST+0,sp)
 330  0020 1106          	cp	a,(OFST+5,sp)
 331  0022 25ed          	jrult	L561
 332                     ; 59 }
 335  0024 5b03          	addw	sp,#3
 336  0026 81            	ret
 396                     ; 63 static bool Sensor_FoundObstacle(sensor_t* sensor)
 396                     ; 64 {
 397                     	switch	.text
 398  0027               L571_Sensor_FoundObstacle:
 402                     ; 65 	return !GPIO_ReadInputPin(sensor->port,
 402                     ; 66 														sensor->pin);
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
 487                     ; 82 static void Actuator_Init(actuator_t* actuator)
 487                     ; 83 {
 488                     	switch	.text
 489  0039               L722_Actuator_Init:
 491  0039 89            	pushw	x
 492       00000000      OFST:	set	0
 495                     ; 84 	GPIO_Init(actuator->port,actuator->pin,
 495                     ; 85 						GPIO_MODE_OUT_OD_LOW_FAST);
 497  003a 4ba0          	push	#160
 498  003c e602          	ld	a,(2,x)
 499  003e 88            	push	a
 500  003f fe            	ldw	x,(x)
 501  0040 cd0000        	call	_GPIO_Init
 503  0043 85            	popw	x
 504                     ; 86 	GPIO_WriteLow(actuator->port,actuator->pin);
 506  0044 1e01          	ldw	x,(OFST+1,sp)
 507  0046 e602          	ld	a,(2,x)
 508  0048 88            	push	a
 509  0049 1e02          	ldw	x,(OFST+2,sp)
 510  004b fe            	ldw	x,(x)
 511  004c cd0000        	call	_GPIO_WriteLow
 513  004f 84            	pop	a
 514                     ; 87 }
 517  0050 85            	popw	x
 518  0051 81            	ret
 575                     ; 89 static void Actuator_MultiInit(actuator_t* actuators[],
 575                     ; 90 														   uint8_t numOfActuators)
 575                     ; 91 {
 576                     	switch	.text
 577  0052               L762_Actuator_MultiInit:
 579  0052 89            	pushw	x
 580  0053 88            	push	a
 581       00000001      OFST:	set	1
 584                     ; 92 	uint8_t i = 0;
 586  0054 0f01          	clr	(OFST+0,sp)
 589  0056 200d          	jra	L523
 590  0058               L123:
 591                     ; 95 		Actuator_Init(actuators[i]);
 593  0058 7b01          	ld	a,(OFST+0,sp)
 594  005a 5f            	clrw	x
 595  005b 97            	ld	xl,a
 596  005c 58            	sllw	x
 597  005d 72fb02        	addw	x,(OFST+1,sp)
 598  0060 fe            	ldw	x,(x)
 599  0061 add6          	call	L722_Actuator_Init
 601                     ; 96 		i++;
 603  0063 0c01          	inc	(OFST+0,sp)
 605  0065               L523:
 606                     ; 93 	while(i < numOfActuators)
 608  0065 7b01          	ld	a,(OFST+0,sp)
 609  0067 1106          	cp	a,(OFST+5,sp)
 610  0069 25ed          	jrult	L123
 611                     ; 98 }
 614  006b 5b03          	addw	sp,#3
 615  006d 81            	ret
 684                     ; 100 static void Actuator_Write(actuator_t* actuator,
 684                     ; 101 													 actuatorState state)
 684                     ; 102 {
 685                     	switch	.text
 686  006e               L133_Actuator_Write:
 688  006e 89            	pushw	x
 689       00000000      OFST:	set	0
 692                     ; 103 	switch(state)
 694  006f 7b05          	ld	a,(OFST+5,sp)
 696                     ; 110 			break;
 697  0071 4d            	tnz	a
 698  0072 2705          	jreq	L333
 699  0074 4a            	dec	a
 700  0075 2710          	jreq	L533
 701  0077 201a          	jra	L573
 702  0079               L333:
 703                     ; 105 		case OFF:
 703                     ; 106 			GPIO_WriteLow(actuator->port,actuator->pin);
 705  0079 1e01          	ldw	x,(OFST+1,sp)
 706  007b e602          	ld	a,(2,x)
 707  007d 88            	push	a
 708  007e 1e02          	ldw	x,(OFST+2,sp)
 709  0080 fe            	ldw	x,(x)
 710  0081 cd0000        	call	_GPIO_WriteLow
 712  0084 84            	pop	a
 713                     ; 107 			break;
 715  0085 200c          	jra	L573
 716  0087               L533:
 717                     ; 108 		case ON:
 717                     ; 109 			GPIO_WriteHigh(actuator->port,actuator->pin);
 719  0087 1e01          	ldw	x,(OFST+1,sp)
 720  0089 e602          	ld	a,(2,x)
 721  008b 88            	push	a
 722  008c 1e02          	ldw	x,(OFST+2,sp)
 723  008e fe            	ldw	x,(x)
 724  008f cd0000        	call	_GPIO_WriteHigh
 726  0092 84            	pop	a
 727                     ; 110 			break;
 729  0093               L573:
 730                     ; 112 }
 733  0093 85            	popw	x
 734  0094 81            	ret
 737                     	switch	.ubsct
 738  0000               L104_sensorDeactivated:
 739  0000 00            	ds.b	1
 740  0001               L304_currentTick:
 741  0001 00000000      	ds.b	4
 828                     ; 114 static void ControlTimedOutput(sensor_t* sensor,
 828                     ; 115 														   actuator_t* actuator,
 828                     ; 116 															 uint32_t actuationTime,
 828                     ; 117 															 uint32_t shutOffTime)
 828                     ; 118 {
 829                     	switch	.text
 830  0095               L773_ControlTimedOutput:
 832  0095 89            	pushw	x
 833       00000000      OFST:	set	0
 836                     ; 122 	if(!sensorDeactivated)
 838  0096 3d00          	tnz	L104_sensorDeactivated
 839  0098 2636          	jrne	L354
 840                     ; 124 		if(Sensor_FoundObstacle(sensor))
 842  009a ad8b          	call	L571_Sensor_FoundObstacle
 844  009c 4d            	tnz	a
 845  009d 2728          	jreq	L554
 846                     ; 126 			Actuator_Write(actuator,ON);
 848  009f 4b01          	push	#1
 849  00a1 1e06          	ldw	x,(OFST+6,sp)
 850  00a3 adc9          	call	L133_Actuator_Write
 852  00a5 84            	pop	a
 853                     ; 127 			DelayMs(actuationTime);
 855  00a6 1e09          	ldw	x,(OFST+9,sp)
 856  00a8 89            	pushw	x
 857  00a9 1e09          	ldw	x,(OFST+9,sp)
 858  00ab 89            	pushw	x
 859  00ac cd0000        	call	_DelayMs
 861  00af 5b04          	addw	sp,#4
 862                     ; 128 			Actuator_Write(actuator,OFF);
 864  00b1 4b00          	push	#0
 865  00b3 1e06          	ldw	x,(OFST+6,sp)
 866  00b5 adb7          	call	L133_Actuator_Write
 868  00b7 84            	pop	a
 869                     ; 129 			sensorDeactivated = 1;
 871  00b8 35010000      	mov	L104_sensorDeactivated,#1
 872                     ; 130 			currentTick = GetTick();
 874  00bc cd0000        	call	_GetTick
 876  00bf ae0001        	ldw	x,#L304_currentTick
 877  00c2 cd0000        	call	c_rtol
 880  00c5 201d          	jra	L164
 881  00c7               L554:
 882                     ; 134 			Actuator_Write(actuator,OFF);
 884  00c7 4b00          	push	#0
 885  00c9 1e06          	ldw	x,(OFST+6,sp)
 886  00cb ada1          	call	L133_Actuator_Write
 888  00cd 84            	pop	a
 889  00ce 2014          	jra	L164
 890  00d0               L354:
 891                     ; 139 		if((GetTick() - currentTick) >= shutOffTime)
 893  00d0 cd0000        	call	_GetTick
 895  00d3 ae0001        	ldw	x,#L304_currentTick
 896  00d6 cd0000        	call	c_lsub
 898  00d9 96            	ldw	x,sp
 899  00da 1c000b        	addw	x,#OFST+11
 900  00dd cd0000        	call	c_lcmp
 902  00e0 2502          	jrult	L164
 903                     ; 141 			sensorDeactivated = 0;
 905  00e2 3f00          	clr	L104_sensorDeactivated
 906  00e4               L164:
 907                     ; 144 }
 910  00e4 85            	popw	x
 911  00e5 81            	ret
 963                     ; 146 static void ReadSensorDriveOutput(sensor_t* sensor,
 963                     ; 147 																	actuator_t* actuator)
 963                     ; 148 {
 964                     	switch	.text
 965  00e6               L564_ReadSensorDriveOutput:
 967  00e6 89            	pushw	x
 968       00000000      OFST:	set	0
 971                     ; 149 	if(Sensor_FoundObstacle(sensor))
 973  00e7 cd0027        	call	L571_Sensor_FoundObstacle
 975  00ea 4d            	tnz	a
 976  00eb 270a          	jreq	L515
 977                     ; 151 		Actuator_Write(actuator,ON);
 979  00ed 4b01          	push	#1
 980  00ef 1e06          	ldw	x,(OFST+6,sp)
 981  00f1 cd006e        	call	L133_Actuator_Write
 983  00f4 84            	pop	a
 985  00f5 2008          	jra	L715
 986  00f7               L515:
 987                     ; 155 		Actuator_Write(actuator,OFF);
 989  00f7 4b00          	push	#0
 990  00f9 1e06          	ldw	x,(OFST+6,sp)
 991  00fb cd006e        	call	L133_Actuator_Write
 993  00fe 84            	pop	a
 994  00ff               L715:
 995                     ; 157 }
 998  00ff 85            	popw	x
 999  0100 81            	ret
1002                     .const:	section	.text
1003  0000               L125_soapSensor:
1004  0000 5005          	dc.w	20485
1005  0002 01            	dc.b	1
1006  0003               L325_fanSensor:
1007  0003 5005          	dc.w	20485
1008  0005 02            	dc.b	2
1009  0006               L525_waterSensor:
1010  0006 5005          	dc.w	20485
1011  0008 04            	dc.b	4
1012  0009               L725_sensors:
1013  0009 000000000000  	ds.b	6
1014  000f               L135_soapValve:
1015  000f 5005          	dc.w	20485
1016  0011 08            	dc.b	8
1017  0012               L335_fan:
1018  0012 5005          	dc.w	20485
1019  0014 10            	dc.b	16
1020  0015               L535_waterValve:
1021  0015 5005          	dc.w	20485
1022  0017 20            	dc.b	32
1023  0018               L735_led:
1024  0018 5019          	dc.w	20505
1025  001a 10            	dc.b	16
1026  001b               L145_actuators:
1027  001b 000000000000  	ds.b	8
1175                     ; 159 int main(void)
1175                     ; 160 {
1176                     	switch	.text
1177  0101               _main:
1179  0101 522b          	subw	sp,#43
1180       0000002b      OFST:	set	43
1183                     ; 162 	uint32_t soapDispensationTime = 10000; //10 secs
1185  0103 ae2710        	ldw	x,#10000
1186  0106 1f14          	ldw	(OFST-23,sp),x
1187  0108 ae0000        	ldw	x,#0
1188  010b 1f12          	ldw	(OFST-25,sp),x
1190                     ; 163 	uint32_t soapValveShutOffTime = 60000; //1 minute
1192  010d aeea60        	ldw	x,#60000
1193  0110 1f18          	ldw	(OFST-19,sp),x
1194  0112 ae0000        	ldw	x,#0
1195  0115 1f16          	ldw	(OFST-21,sp),x
1197                     ; 165 	sensor_t soapSensor = {GPIOB,GPIO_PIN_0};
1199  0117 96            	ldw	x,sp
1200  0118 1c001a        	addw	x,#OFST-17
1201  011b 90ae0000      	ldw	y,#L125_soapSensor
1202  011f a603          	ld	a,#3
1203  0121 cd0000        	call	c_xymov
1205                     ; 166 	sensor_t fanSensor = {GPIOB,GPIO_PIN_1};
1207  0124 96            	ldw	x,sp
1208  0125 1c001d        	addw	x,#OFST-14
1209  0128 90ae0003      	ldw	y,#L325_fanSensor
1210  012c a603          	ld	a,#3
1211  012e cd0000        	call	c_xymov
1213                     ; 167 	sensor_t waterSensor = {GPIOB,GPIO_PIN_2};
1215  0131 96            	ldw	x,sp
1216  0132 1c0020        	addw	x,#OFST-11
1217  0135 90ae0006      	ldw	y,#L525_waterSensor
1218  0139 a603          	ld	a,#3
1219  013b cd0000        	call	c_xymov
1221                     ; 169 	sensor_t* sensors[NUM_SENSORS] = 
1221                     ; 170 	{&soapSensor,&fanSensor,&waterSensor};
1223  013e 96            	ldw	x,sp
1224  013f 1c0001        	addw	x,#OFST-42
1225  0142 90ae0009      	ldw	y,#L725_sensors
1226  0146 a606          	ld	a,#6
1227  0148 cd0000        	call	c_xymov
1229  014b 96            	ldw	x,sp
1230  014c 1c001a        	addw	x,#OFST-17
1231  014f 1f01          	ldw	(OFST-42,sp),x
1233  0151 96            	ldw	x,sp
1234  0152 1c001d        	addw	x,#OFST-14
1235  0155 1f03          	ldw	(OFST-40,sp),x
1237  0157 96            	ldw	x,sp
1238  0158 1c0020        	addw	x,#OFST-11
1239  015b 1f05          	ldw	(OFST-38,sp),x
1241                     ; 173 	actuator_t soapValve = {GPIOB,GPIO_PIN_3};
1243  015d 96            	ldw	x,sp
1244  015e 1c0023        	addw	x,#OFST-8
1245  0161 90ae000f      	ldw	y,#L135_soapValve
1246  0165 a603          	ld	a,#3
1247  0167 cd0000        	call	c_xymov
1249                     ; 174 	actuator_t fan = {GPIOB,GPIO_PIN_4};
1251  016a 96            	ldw	x,sp
1252  016b 1c0026        	addw	x,#OFST-5
1253  016e 90ae0012      	ldw	y,#L335_fan
1254  0172 a603          	ld	a,#3
1255  0174 cd0000        	call	c_xymov
1257                     ; 175 	actuator_t waterValve = {GPIOB,GPIO_PIN_5};
1259  0177 96            	ldw	x,sp
1260  0178 1c0029        	addw	x,#OFST-2
1261  017b 90ae0015      	ldw	y,#L535_waterValve
1262  017f a603          	ld	a,#3
1263  0181 cd0000        	call	c_xymov
1265                     ; 176 	actuator_t led = {GPIOF,GPIO_PIN_4};
1267  0184 96            	ldw	x,sp
1268  0185 1c0007        	addw	x,#OFST-36
1269  0188 90ae0018      	ldw	y,#L735_led
1270  018c a603          	ld	a,#3
1271  018e cd0000        	call	c_xymov
1273                     ; 178 	actuator_t* actuators[NUM_ACTUATORS] = 
1273                     ; 179 	{&soapValve,&fan,&waterValve,&led};
1275  0191 96            	ldw	x,sp
1276  0192 1c000a        	addw	x,#OFST-33
1277  0195 90ae001b      	ldw	y,#L145_actuators
1278  0199 a608          	ld	a,#8
1279  019b cd0000        	call	c_xymov
1281  019e 96            	ldw	x,sp
1282  019f 1c0023        	addw	x,#OFST-8
1283  01a2 1f0a          	ldw	(OFST-33,sp),x
1285  01a4 96            	ldw	x,sp
1286  01a5 1c0026        	addw	x,#OFST-5
1287  01a8 1f0c          	ldw	(OFST-31,sp),x
1289  01aa 96            	ldw	x,sp
1290  01ab 1c0029        	addw	x,#OFST-2
1291  01ae 1f0e          	ldw	(OFST-29,sp),x
1293  01b0 96            	ldw	x,sp
1294  01b1 1c0007        	addw	x,#OFST-36
1295  01b4 1f10          	ldw	(OFST-27,sp),x
1297                     ; 182 	Sensor_MultiInit(sensors,NUM_SENSORS);
1299  01b6 4b03          	push	#3
1300  01b8 96            	ldw	x,sp
1301  01b9 1c0002        	addw	x,#OFST-41
1302  01bc cd000b        	call	L331_Sensor_MultiInit
1304  01bf 84            	pop	a
1305                     ; 183 	Actuator_MultiInit(actuators,NUM_ACTUATORS);
1307  01c0 4b04          	push	#4
1308  01c2 96            	ldw	x,sp
1309  01c3 1c000b        	addw	x,#OFST-32
1310  01c6 cd0052        	call	L762_Actuator_MultiInit
1312  01c9 84            	pop	a
1313                     ; 187 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);				 
1315  01ca 4f            	clr	a
1316  01cb cd0000        	call	_CLK_HSIPrescalerConfig
1318                     ; 188 	TIM1_TimeBaseInit(128,TIM1_COUNTERMODE_UP,124,0);	
1320  01ce 4b00          	push	#0
1321  01d0 ae007c        	ldw	x,#124
1322  01d3 89            	pushw	x
1323  01d4 4b00          	push	#0
1324  01d6 ae0080        	ldw	x,#128
1325  01d9 cd0000        	call	_TIM1_TimeBaseInit
1327  01dc 5b04          	addw	sp,#4
1328                     ; 189 	TIM1_ITConfig(TIM1_IT_UPDATE,ENABLE);
1330  01de ae0101        	ldw	x,#257
1331  01e1 cd0000        	call	_TIM1_ITConfig
1333                     ; 190 	TIM1_Cmd(ENABLE);
1335  01e4 a601          	ld	a,#1
1336  01e6 cd0000        	call	_TIM1_Cmd
1338                     ; 192 	enableInterrupts();
1341  01e9 9a            rim
1343  01ea               L536:
1344                     ; 197 		ControlTimedOutput(&soapSensor,&soapValve,
1344                     ; 198 											 soapDispensationTime,
1344                     ; 199 											 soapValveShutOffTime);
1346  01ea 1e18          	ldw	x,(OFST-19,sp)
1347  01ec 89            	pushw	x
1348  01ed 1e18          	ldw	x,(OFST-19,sp)
1349  01ef 89            	pushw	x
1350  01f0 1e18          	ldw	x,(OFST-19,sp)
1351  01f2 89            	pushw	x
1352  01f3 1e18          	ldw	x,(OFST-19,sp)
1353  01f5 89            	pushw	x
1354  01f6 96            	ldw	x,sp
1355  01f7 1c002b        	addw	x,#OFST+0
1356  01fa 89            	pushw	x
1357  01fb 96            	ldw	x,sp
1358  01fc 1c0024        	addw	x,#OFST-7
1359  01ff cd0095        	call	L773_ControlTimedOutput
1361  0202 5b0a          	addw	sp,#10
1362                     ; 201 		ReadSensorDriveOutput(&fanSensor,&fan);
1364  0204 96            	ldw	x,sp
1365  0205 1c0026        	addw	x,#OFST-5
1366  0208 89            	pushw	x
1367  0209 96            	ldw	x,sp
1368  020a 1c001f        	addw	x,#OFST-12
1369  020d cd00e6        	call	L564_ReadSensorDriveOutput
1371  0210 85            	popw	x
1372                     ; 202 		ReadSensorDriveOutput(&waterSensor,&waterValve);
1374  0211 96            	ldw	x,sp
1375  0212 1c0029        	addw	x,#OFST-2
1376  0215 89            	pushw	x
1377  0216 96            	ldw	x,sp
1378  0217 1c0022        	addw	x,#OFST-9
1379  021a cd00e6        	call	L564_ReadSensorDriveOutput
1381  021d 85            	popw	x
1383  021e 20ca          	jra	L536
1396                     	xdef	_main
1397                     	xref	_GetTick
1398                     	xref	_DelayMs
1399                     	xref	_TIM1_ITConfig
1400                     	xref	_TIM1_Cmd
1401                     	xref	_TIM1_TimeBaseInit
1402                     	xref	_GPIO_ReadInputPin
1403                     	xref	_GPIO_WriteLow
1404                     	xref	_GPIO_WriteHigh
1405                     	xref	_GPIO_Init
1406                     	xref	_CLK_HSIPrescalerConfig
1407                     	xref.b	c_x
1426                     	xref	c_xymov
1427                     	xref	c_lcmp
1428                     	xref	c_lsub
1429                     	xref	c_rtol
1430                     	end
