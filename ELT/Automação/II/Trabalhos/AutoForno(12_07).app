This is an Elipse Windows Application file.[   Elipse Demo v2.29 build 151 & 	Aplica��oAplica��o Elipse SCADA       
�OnKeyPressEsc(Ativado quando a tecla Esc � pressionada       () 
           #
       
TagsGrupo Principal de Tags      ��  CPlcTag	Analogica	Analogica    ��   CBitTag

SensorTemp!Mapeia bits do valor de outro tag            
         �         
         �   + +  -1+}                ��@             ��@
     �Entradastag001    �
	Sensor_E1!Mapeia bits do valor de outro tag        HighAlarme High	              �?Placa entrando no forno.   
         �    �
	Sensor_E3!Mapeia bits do valor de outro tag
        HighAlarme High              �?Placa saindo do forno.   
         �  �

Emergencia!Mapeia bits do valor de outro tag        HighAlarme High               �?Parada de emerg�ncia.   
         �  �
Liga!Mapeia bits do valor de outro tag        HighAlarme High              �?Sistema ligado.   
         �  �
Desliga!Mapeia bits do valor de outro tag        HighAlarme High              �?Sistema desligado.   
         �         
         �   + +  -+}                ��@             ��@
     ��   CExprTagPlacas_na_EsteirasPlacasE1            
         �  + + 3* + 4* + 3* 
       
      
      
      
      @     #
     
        
     
   
     
   
     
 �Saidastag001    �
E1!Mapeia bits do valor de outro tag        HighAlarme High              �?Esteira 1 ligada. Low
Alarme Low                 Esteira 1 desligada. 
         �    �
E2!Mapeia bits do valor de outro tag        HighAlarme High              �?Esteira 2 ligada. Low
Alarme Low                 Esteira 2 desligada. 
         �  �
E3!Mapeia bits do valor de outro tag        HighAlarme High              �?Esteira 3 ligada. Low
Alarme Low                 Esteira 3 desligada. 
         �  �
P1!Mapeia bits do valor de outro tag        HighAlarme High              �?Porta de entrada aberta Low
Alarme Low                  Porta de entrada fechada 
         �  �
P2!Mapeia bits do valor de outro tag!        HighAlarme High"              �?Porta de sa�da aberta. Low
Alarme Low#                 Porta de sa�da fechada. 
         �  �
Proc_Aquecimento!Mapeia bits do valor de outro tag        HighAlarme High$              �?Forno ligado. Low
Alarme Low%                 Forno desligado. 
         �         
         �   + +  -+}                ��@             ��@
     �	Cozimento	Cozimento&            
         �   + +  ++}                ��@             ��@
     �E3_MovimentandoE3_Movimentando'            
         �   + +  ++}                ��@             ��@
     �TemperaturaTemperatura(            
         �  
*(400/999) 
            #
     �  �  
 �Temporizador_CozimentoTemporizador_Cozimento)            
         �  /100 
&            #
&     d      
TelasTelas de Aplica��o*    ��   CScreenItemAlarmeAlarme+    ��  CAlarmsAlarme1Objeto Alarme,       
MolduraObjeto moldura-       
��      �        ARIAL                 �V  �  	Hist�rico    ���        � 9 ~�     ����              ����         � 
 
      ��� �         � �     � ��� ��� s  
��      ,    "Courier New                     
      dd/mmhh:mm:ss�   ���     !       ���     "   B       �   ��� C   c       �     �� 	 C21ButtonSinotipoObjeto Bot�o.       
MolduraObjeto moldura/       
��      �        ARIAL           ����   �      T�tulo     ���        �
 3  1�         ����   /�              
��      �        ARIAL       ����
   ,�         
��      �        ARIAL       ����   �         SIN�TIPO (F5)SIN�TIPO (F5)    ���     ���       �?         t 
0      �Bot�o1Objeto Bot�o1       
MolduraObjeto moldura2       
��      �        ARIAL           ����   �      T�tulo     ���        �
 }3  1�         ����   /�              
��      �        ARIAL       ����
   ,�         
��      �        ARIAL       ����   �         
LOGIN (F4)
LOGIN (F4)    ���     ���       �?         s 
3          ��      � �        	Tela1.htm�LoginLogin3          ��     � �        	Tela1.htm�SinotipoSinotipo0    ��  CDisplayDisplay3Objeto Display4       
MolduraObjeto moldura5       
��      �        ARIAL ��   �        ����   Temperatura do Forno    ���       (     �� 8�  ����   �        ����   �       
��      �    "MS Sans Serif                       ���         m/d�Display2Objeto Display6       
MolduraObjeto moldura7       
��      �        ARIAL         ����   1�      Tempo de sa�da    ���        �Q 8�  .�         ����                  
��      �    "MS Sans Serif                       ���     s   m/d�Display1Objeto Display8       
MolduraObjeto moldura9       
��      �        ARIAL   ����   P�         ����Tempo de cozimento    ���       )     � 8?      ����   W�         ����        
��      �    "MS Sans Serif                       ���     s   m/d��  CTrend
Tend�ncia1Objeto Tend�ncia:       
MolduraObjeto moldura;       
��      �        ARIAL   ����   R�          ����T�tulo    ���        �  ��      ����             ����              �?      $@      PlotagemDados do gr�fico de plotagem<    ��   CTagPlotPenpen1Pena de Desenho=          ��           �?         ��� ���     ���       @        &4���A�6���A
��      �       Arial                                 %hh:mm:sshh:mm:ss      �Alarme1Objeto Alarme>       
MolduraObjeto moldura?       
��      �        ARIAL               `}w�  �  Alarmes    ���        � ��� ����   �         ����   �         � 2 
      ��� �         � �     � ��� ��� �  
��      ,    "Courier New                     
      dd/mmhh:mm:ss�   ���     !       ���     "   B       �   ��� C   c       �     �AlarmeObjeto Bot�o@       
MolduraObjeto molduraA       
��      �        ARIAL           ����   �      T�tulo     ���         � � �  1�         ����   /�              
��      �        ARIAL       ����
   ,�         
��      �        ARIAL       ����   �         ALARME (F5)ALARME (F5)    ���     ���       �?         t 
+      �Bot�o1Objeto Bot�oB       
MolduraObjeto molduraC       
��      �        ARIAL           ����   �      T�tulo     ���         � � �  1�         ����   /�              
��      �        ARIAL       ����
   ,�         
��      �        ARIAL       ����   �         
LOGIN (F4)
LOGIN (F4)    ���     ���       �?         s 
3      �Bot�o2Objeto Bot�oD       
MolduraObjeto molduraE       
��      �        ARIAL           ����   �      T�tulo     ���              � ,  1�         ����   /�              
��      �        ARIAL       ����
   ,�         
��      �        ARIAL       ����   �         	LIGA (F1)	LIGA (F1)    ���     ���       �?         p   �Bot�o3Objeto Bot�oF       
MolduraObjeto molduraG       
��      �        ARIAL           ����   �      T�tulo     ���             2 � [  1�         ����   /�              
��      �        ARIAL       ����
   ,�         
��      �        ARIAL       ����   �         DESLIGA (F2)DESLIGA (F2)    ���     ���       �?         q   �Bot�o4Objeto Bot�oH       
MolduraObjeto molduraI       
��      �        ARIAL           ����   �      T�tulo     ���             c � �  1�         ����   /�              
��      �        ARIAL       ����
   ,�         
��      �        ARIAL       ����   �         EMERG�NCIA  (F3)EMERG�NCIA (F3)    ���     ���       �?         r   �� 
 CAnimation	Anima��o1Objeto de Anima��oJ       
MolduraObjeto molduraK       
��      �        ARIAL ��             ����   T�tulo     ���            � ���� ����             ����
   ,�         ��� 
�� ��  CAnimationZone                   mc:\users\usuario\desktop\elt 372 2022-1\desafio 3\aquecimento placas\aquecimento placas\imagens\esteira_1.bmp�      �?      �?   tc:\users\usuario\desktop\elt 372 2022-1\desafio 3\aquecimento placas\aquecimento placas\imagens\esteira_1_inicio.bmp�       @       @   oc:\users\usuario\desktop\elt 372 2022-1\desafio 3\aquecimento placas\aquecimento placas\imagens\esteira_1_4.bmp�      @      @   sc:\users\usuario\desktop\elt 372 2022-1\desafio 3\aquecimento placas\aquecimento placas\imagens\esteira_3_vazia.bmp�      @      @   tc:\users\usuario\desktop\elt 372 2022-1\desafio 3\aquecimento placas\aquecimento placas\imagens\esteira_3_inicio.bmp�      @      @   oc:\users\usuario\desktop\elt 372 2022-1\desafio 3\aquecimento placas\aquecimento placas\imagens\esteira_3_6.bmpd   �Display4Objeto DisplayL       
MolduraObjeto molduraM       
��      �        ARIAL                          T�tulo    ���             �r �     ��                            
��      �    "MS Sans Serif                       ���         m/d�Display5Objeto DisplayN       
MolduraObjeto molduraO       
��      �        ARIAL                          T�tulo    ���             "| �     ��                            
��      �    "MS Sans Serif                       ���         m/d    ���     � �        	Tela1.htm  ScriptsScripts definidos pelo Usu�rioP       
ReceitaReceitaQ       
	Hist�ricoLista de Hist�ricosR       
Relat�rios Lista de relat�rios da aplica��oS       
PrintersPrinterT       
Drivers%Lista de drivers de comunica��o (DLL)U    ��   CDriverDriver1DLL Communication Driver       Hc:\users\usuario\desktop\material elt 372\driver elipse scada\modbus.dllBElipse Driver Modicon Modbus v2.08 Build 17 (Oct 19 2012 16:29:21)  -  -  -  -     5c:\users\usuario\desktop\MATERI~1\DRIVER~1\modbus.dll 
�U 	Generic Config Data v1.00	!ModiconModbus.DefaultSlaveAddress   	IO.RecoverEnable   	IO.StartOffline    	IO.ConnectionMode    	ModiconModbus.MaxPDUSize�   	$ModiconModbus.UseDefaultSlaveAddress    	IO.Serial.DataBits   	!ModiconModbus.UseSwapAddressDelay    	IO.Serial.DelayBeforeMs    	IO.Serial.RTS    	ModiconModbus.Olderaddr   	IO.Serial.Baudrate �  	IO.InactivityEnable    	 ModiconModbus.WaitSilenceOnError   	IO.GiveUpEnable    	IO.GiveUpTries   	IO.Serial.DTR    	ModiconModbus.ModbusMode    	IO.Serial.StopBits   	IO.Serial.Port   	IO.Serial.WaitCTS    	IO.Serial.InterframeDelayMs    	!ModiconModbus.UserTypesConfigFile	��// USER DEFINED TYPES SAMPLE CONFIG FILE

// The samples below illustrate how to create user defined structs, using the driver built-in types (note the built-in 
// types must be entered with the same keywords used in the Data combobox of the operations).
// The new user types can afterwards be used in the same way as the other built-in types in the Data combobox.

/* Sample types entirely commented by default

struct TYPE1 // TYPE 1 - declares struct with elements with no name, and no timestamp
{
  int16;
  word;
  dword;
  int32;
}

// TYPE2 declares named elements, and includes a timestamp of GenTime type.  The named elements can then be
// loaded to the user application using E3 Tag Browser.

// NOTE: the timestamp value will not be returned on a block element, but rather returned on the timestamp property
// of the block type tag. The order in which the timestamp appears within the structure  is related  to  the  order
// in which this field appears within the data area of the received protocol frame (usually the first field).

struct TYPE2
{ 
  timestamp = GenTime; // this time field will be returned in the block's timestamp field
  GenTime timeField; // this time field will be returned in the block's first element
  dword dwordField;
}

struct TYPE3 // this type has a timestamp of type UTC32 and some named elements
{
  DefaultAddress = 0x101;
  timestamp = UTC32;
  float Va;
  float Vb;
  float Vc;
  float Ia;
  float Ib;
  float Ic;  
}

*/	IO.Log.Filename	C:\Modbus.log	IO.RecoverPeriodSec   	IO.TimeoutMs}   	IO.Log.Enable    	IO.Serial.SupressEcho    	IO.Ethernet.MainPort�  	IO.Serial.CTSTimeoutMs    	!ModiconModbus.EnableCMSAddressing    	ModiconModbus.SwapAddressDelay    	IO.Debug    	IO.Serial.InterbyteDelayUs    	IO.Type	Serial	IO.Serial.Parity    	IO.InactivityPeriodSec    	ModiconModbus.ConfigFile	�%[Functions]
Function:	1
Read:	3
Write:	16
Type:	word
Size:	2
FrameOrder:	0
ByteOrder:	0
WordOrder:	0
DWordOrder:	0
Function:	2
Read:	3
Write:	16
Type:	dword
Size:	4
FrameOrder:	0
ByteOrder:	0
WordOrder:	0
DWordOrder:	0
Function:	3
Read:	3
Write:	16
Type:	int16
Size:	2
FrameOrder:	0
ByteOrder:	0
WordOrder:	0
DWordOrder:	0
Function:	4
Read:	3
Write:	16
Type:	int32
Size:	4
FrameOrder:	0
ByteOrder:	0
WordOrder:	0
DWordOrder:	0
Function:	5
Read:	3
Write:	16
Type:	float
Size:	4
FrameOrder:	0
ByteOrder:	0
WordOrder:	0
DWordOrder:	0
Function:	6
Read:	1
Write:	15
Type:	bit
Size:	0
FrameOrder:	0
ByteOrder:	0
WordOrder:	0
DWordOrder:	0
Function:	7
Read:	2
Write:	0
Type:	bit
Size:	0
FrameOrder:	0
ByteOrder:	0
WordOrder:	0
DWordOrder:	0
[End]
	)ModiconModbus.EnableReconnectAfterTimeout    	%ModiconModbus.EnableGenSOERegGrouping   	#ModiconModbus.EnCustomizeMaxPDUSize    	IO.Serial.DelayAfterMs      
	DatabasesODBC databasesV       AlarmesConfigura��o do alarme       
alarms.dat   d       
Aplica��esRemotasLista de Aplica��es RemotasW          ���@
 0   
 
output.txt
   
   
   
   
   
   
   
   ���     ���       X�   
WatcherObjetos do WatcherX       Steeplechase%Interface com o Software SteeplechaseY       � .\

OPCServersOPC Server ListZ         �   