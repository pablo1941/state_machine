/*Fuente de consulta http://www.emcu.it/STM8/STM8-Discovery/Tim4/TIM4.html
http://www.emcu.eu/

/


/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "main.h"
/* Private macro -------------------------------------------------------------*/
/**Macros de los estados*/
#define ESTADO_ESPERAR (1)
#define ESTADO_RECIBIR (2)
#define ESTADO_VISUALIZAR (3)
#define ESTADO_HISTORICOS (4)
#define ESTADO_NOTIFICACION (5)
#define ESTADO_ALARMA (6)
#define ESTADO_WARNING (7)
#define ESTADO_INICIO (8)
#define ESTADO_FIN (9)
/*Macros de constantes*/
// Repeticiones de visualizaci�n de %Bateria y %recarga
#define UMBRAL_CONTEO (10)
/*Macros de comandos de I2C*/
#define CMD_BATERIA ('B')
#define CMD_RECARGA ('R')
#define CMD_NOTIFICACION ('N')
#define CMD_ALARMA ('A')
#define CMD_INICIO ('I')
#define CMD_WARNING ('W')
/*Macros de condiciones de arranque del dispositivo EngineV1*/
#define COND_ALIVE_FALLO_FIN (16)
#define COND_ALIVE_FALLO (10)
#define COND_ALIVE (9)
#define COND_DIAGNOSTICO (8)
#define COND_END_ADMIN (7)
#define COND_INIT_ADMIN (6)
#define COND_PIN_INVALIDO (5)
#define COND_PIN_VALIDO (4)
#define COND_ULTIMO_DIA (3)

#define COND_END_RFID (1)
#define COND_INIT_RFID (0)

/**Macros de condici�n de Inicio*/
#define COND_MOSTRAR_RECARGA (2)
#define COND_BOOT_INIT (1)
#define COND_BOOT_STOP (0)

/*Tiempo [segundos] de espera para detener visualizaci�n de la alarma*/
#define TOUT_ALARMA (60)
#define TOUT_RECARGA (3)
/*Macro de la direcci�n I2C*/
#define ADDR_VISUAL (0x40)
/*Direcciones EEPROM*/
#define ADDR_BASE (0x4000)
#define ADDR_BATERIA (0x4006)
#define ADDR_RECARGA (0x4007)
/**/
#define TIME_RESTART (260)
#define TIME_ALIVE (3)
#define TIME_STATUS (5)
/* Private variables ---------------------------------------------------------*/
/*Variables de interrupci�n*/
volatile bool flag_boton;
volatile bool flag_alarma;
volatile bool flag_buzzer;
volatile bool flag_recibir;
volatile bool flag_historicos;
volatile bool flag_notificacion;
volatile bool flag_reinicio;
volatile bool flag_tim2;
volatile int cont_tim2;
volatile int cont_restart;
volatile uint8_t cont_ruleta = 0;
volatile uint8_t contPulsos = 1;
volatile uint8_t contReinicio = 1;
volatile uint8_t contHist = 1;
volatile uint8_t Slave_Buffer_Rx[2];
/*Variables globales*/
static uint8_t estado;
static uint8_t porcentajeBat = 0;
static uint8_t porcentajeRec = 0;
static uint8_t alarma = 0;
static uint8_t alarma_init = 0;
static uint8_t arrayBinario[5] = {0, 0, 0, 0, 0};
/*Alarmas*/
static uint8_t a1 = 0;
static uint8_t a2 = 0;
static uint8_t a3 = 0;
static uint8_t a4 = 0;
static uint8_t a5 = 0;
static uint8_t a_EE = 0;
static uint8_t recarga_provisional = 0;
static uint8_t porcBat = 0;
static uint8_t visualBat = 0;
static uint8_t visualRec = 0;

int ja;
/* Private function prototypes -----------------------------------------------*/
void actualizarLeds(uint8_t valor, uint8_t cmd);
void refrescarLed(uint8_t posicion, uint8_t estadoLed, uint8_t cmd);
void apagarLeds(void);
void inicializar(void);
void encenderBuzzer(void);
void apagarBuzzer(void);
void guardarAlarma(void);
void leerAlarma(void);
void refrescarIWDG(void);
void sinSaldo(void);
void signalStatus(bool estado);

/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/
/**
 * @brief  Main program.
 * @param  None
 * @retval None
 */
void main(void)
{
	/*Configuraci�n de perif�ricos. */
	conf_GPIO();
	EXTI_setup();
	clock_setup();
	Flash_setup();
	TIM1_setup();
	TIM2_setup();
	// I2C_setup();
	UART1_setup();
	encenderBuzzer();

	config_IWDT();
	enableInterrupts();
	encenderBuzzer();
	apagarLeds();
	actualizarLeds(31 - 4, CMD_RECARGA);
	actualizarLeds(4, CMD_BATERIA);
	for (ja = 0; ja < 30000; ja++)
		;
	for (ja = 0; ja < 30000; ja++)
		;
	for (ja = 0; ja < 30000; ja++)
		;
	for (ja = 0; ja < 30000; ja++)
		;
	for (ja = 0; ja < 30000; ja++)
		;

	// Inicializaci�n de variables.
	inicializar();
	/*Loop*/
	while (1)
	{
		refrescarIWDG();
		if (cont_restart == TIME_RESTART)
		{
			cont_restart = 0;
			// while(1);
			continue;
		}
		// Tareao para enviar comando de reinicio STM32
		if (flag_reinicio)
		{
			actualizarLeds(10, CMD_BATERIA);
			actualizarLeds(4, CMD_RECARGA);
			for (ja = 0; ja < 30000; ja++)
				;
			for (ja = 0; ja < 30000; ja++)
				;
			for (ja = 0; ja < 30000; ja++)
				;
			for (ja = 0; ja < 30000; ja++)
				;
			for (ja = 0; ja < 30000; ja++)
				;

			UART1_SendData8('S');
			//			UART1_ClearFlag(UART1_FLAG_TXE);
			for (ja = 0; ja < 30000; ja++)
				;
			for (ja = 0; ja < 30000; ja++)
				;
			for (ja = 0; ja < 30000; ja++)
				;
			UART1_SendData8('T');
			for (ja = 0; ja < 30000; ja++)
				;
			for (ja = 0; ja < 30000; ja++)
				;
			for (ja = 0; ja < 30000; ja++)
				;
			UART1_SendData8('M');
			for (ja = 0; ja < 30000; ja++)
				;
			for (ja = 0; ja < 30000; ja++)
				;
			for (ja = 0; ja < 30000; ja++)
				;
			UART1_SendData8(32);
			UART1_ClearFlag(UART1_FLAG_TXE);

			estado = ESTADO_FIN;
		}
		switch (estado)
		{
		case (ESTADO_ESPERAR):
		{
			refrescarIWDG();
			if (flag_boton)
			{
				estado = ESTADO_VISUALIZAR;
			}
			else if (flag_recibir)
			{
				estado = ESTADO_RECIBIR;
			}
			else if (flag_historicos)
			{
				TIM2_Cmd(ENABLE);
				TIM1_Cmd(ENABLE);
				estado = ESTADO_HISTORICOS;
			}
			break;
		}
		case (ESTADO_RECIBIR):
		{
			refrescarIWDG();
			cont_tim2 = 0;

			switch (Slave_Buffer_Rx[0])
			{
			case (CMD_BATERIA):
			{
				porcentajeBat = Slave_Buffer_Rx[1];
				actualizarEEPROM(ADDR_BATERIA, porcentajeBat);
				estado = ESTADO_FIN;
				break;
			}
			case (CMD_RECARGA):
			{
				porcentajeRec = Slave_Buffer_Rx[1];
				actualizarEEPROM(ADDR_RECARGA, porcentajeRec);
				estado = ESTADO_FIN;
				break;
			}
			case (CMD_ALARMA):
			{
				alarma = Slave_Buffer_Rx[1];
				guardarAlarma();
				TIM2_Cmd(ENABLE);
				TIM1_Cmd(ENABLE);
				estado = ESTADO_ALARMA;

				break;
			}
			case (CMD_NOTIFICACION):
			{
				TIM1_setup2();
				TIM2_Cmd(ENABLE);
				TIM1_Cmd(ENABLE);
				estado = ESTADO_NOTIFICACION;
				// cont_tim2 = 0;
				break;
			}
			case (CMD_INICIO):
			{
				TIM2_Cmd(ENABLE);
				TIM1_Cmd(ENABLE);
				estado = ESTADO_INICIO;
				// cont_tim2 = 0;
				break;
			}
			case (CMD_WARNING):
			{
				alarma_init = Slave_Buffer_Rx[1];
				TIM2_Cmd(ENABLE);
				TIM1_Cmd(ENABLE);
				estado = ESTADO_WARNING;
				break;
			}
			default:
			{
				estado = ESTADO_ESPERAR;
				break;
			}
			}
			flag_recibir = FALSE;
			break;
		}
		// Se debe dar prioridad cuando este mostrando Estados de recarga y bateria
		case (ESTADO_VISUALIZAR):
		{
			recarga_provisional = leerEEPROM(ADDR_RECARGA);
			porcBat = leerEEPROM(ADDR_BATERIA);
			visualBat = 0;
			visualRec = (1 << recarga_provisional) - 1;

			TIM2_Cmd(ENABLE);
			TIM1_Cmd(ENABLE);

			refrescarIWDG();
			// Agregar visualizaci�n estado de bateria
			// Si no hay recarga, muestra se�al de no saldo y el estado de bateria.
			if (porcBat == 0)
			{
				visualBat = 16; // Encender Led5 Rojo para indicar porcentaje de bateria nulo.
			}
			else if (porcBat != 0)
			{
				visualBat = (1 << porcBat) - 1;
			}

			if ((recarga_provisional == 0) && (cont_tim2 <= UMBRAL_CONTEO))
			{
				if (flag_tim2)
				{
					apagarLeds();
					actualizarLeds(visualBat, CMD_BATERIA);
				}
				else if (!flag_tim2)
				{
					apagarLeds();
					// actualizarLeds((1<<leerEEPROM(ADDR_RECARGA)) - 1,CMD_RECARGA);
					sinSaldo();
				}
				estado = ESTADO_VISUALIZAR;
			}
			// Si hay porcentaje de recarga diferente de 0, muestre los dos estados sin novedad.
			else if ((cont_tim2 <= UMBRAL_CONTEO) && (recarga_provisional != 0))
			{
				if (flag_tim2)
				{
					apagarLeds();
					actualizarLeds(visualBat, CMD_BATERIA);
				}
				else if (!flag_tim2)
				{
					apagarLeds();
					actualizarLeds(visualRec, CMD_RECARGA);
				}
				estado = ESTADO_VISUALIZAR;
			}
			// Si se agota el tiempo de visualizaci�n, se apagan las se�ales visuales.
			else if ((cont_tim2 > UMBRAL_CONTEO))
			{
				estado = ESTADO_FIN;
			}
			if (flag_historicos)
			{
				apagarLeds();
				estado = ESTADO_HISTORICOS;
			}

			break;
		}
		case (ESTADO_HISTORICOS):
		{
			refrescarIWDG();
			TIM1_Cmd(ENABLE);
			if (flag_historicos)
			{
				apagarLeds();
				if (cont_tim2 % 4 != 0)
				{
					leerAlarma();
					apagarBuzzer();
				}
				else
				{
					encenderBuzzer();
				}
				estado = ESTADO_HISTORICOS;
			}
			else if (!flag_historicos)
			{
				estado = ESTADO_FIN;
			}
			if (flag_recibir)
			{
				apagarLeds();
				flag_boton = FALSE;
				cont_tim2 = 0;
				estado = ESTADO_RECIBIR;
			}
			break;
		}
		case (ESTADO_ALARMA):
		{
			refrescarIWDG();
			if ((flag_boton == TRUE) || (cont_tim2 > TOUT_ALARMA))
			{
				apagarBuzzer();
				estado = ESTADO_FIN;
			}
			else if ((cont_tim2 <= TOUT_ALARMA))
			{
				apagarLeds();
				actualizarLeds(alarma, CMD_BATERIA); // Alarmas en rojo
				// Cada 3s enciende, apaga 1 s
				if (cont_tim2 % 3 != 0)
				{
					encenderBuzzer();
				}
				else
				{
					apagarBuzzer();
				}
				estado = ESTADO_ALARMA;
			}
			if (flag_recibir)
			{
				apagarLeds();
				flag_boton = FALSE;
				cont_tim2 = 0;
				estado = ESTADO_RECIBIR;
			}
			break;
		}
		case (ESTADO_NOTIFICACION):
		{
			uint8_t notif = Slave_Buffer_Rx[1];
			apagarLeds();

			refrescarIWDG();
			// Agregar macro de notificaci�n = 1 e = 0
			if (flag_notificacion == FALSE)
			{
				flag_notificacion = TRUE;
				cont_tim2 = 1;
			}
			if (notif == COND_END_RFID)
			{
				estado = ESTADO_FIN;
			}
			else if (notif == COND_INIT_RFID)
			{
				if (cont_tim2 < TOUT_RECARGA)
				{
					actualizarLeds((1 << cont_ruleta) - 1, CMD_BATERIA);
					estado = ESTADO_NOTIFICACION;
					encenderBuzzer();
				}
				else if (cont_tim2 >= TOUT_RECARGA)
				{
					estado = ESTADO_FIN;
				}
			}
			else if (notif == COND_ULTIMO_DIA)
			{
				if (cont_tim2 <= UMBRAL_CONTEO)
				{
					sinSaldo();
					estado = ESTADO_NOTIFICACION;
				}
				else if ((cont_tim2 > UMBRAL_CONTEO))
				{
					estado = ESTADO_FIN;
				}
			}
			else if (notif == COND_PIN_VALIDO)
			{
				if (cont_tim2 > 1)
				{
					estado = ESTADO_FIN;
				}
				else
				{
					encenderBuzzer();
					actualizarLeds(24, CMD_RECARGA);
					estado = ESTADO_NOTIFICACION;
				}
			}
			else if (notif == COND_PIN_INVALIDO)
			{
				if (cont_tim2 > 1)
				{
					estado = ESTADO_FIN;
				}
				else
				{
					encenderBuzzer();
					actualizarLeds(24, CMD_BATERIA);
					estado = ESTADO_NOTIFICACION;
				}
			}
			else if (notif == COND_ALIVE)
			{
				if (cont_tim2 > TIME_ALIVE) // Espera 2 segundos para apagar condici�n alive.
				{
					estado = ESTADO_FIN;
				}
				else
				{
					// apagarLeds();
					actualizarLeds(4, CMD_RECARGA); // Enciende el led Azul central.
					estado = ESTADO_NOTIFICACION;
				}
			}
			else if (notif >= COND_ALIVE_FALLO && notif <= COND_ALIVE_FALLO_FIN)
			{
				if (cont_tim2 > TIME_ALIVE) // Espera 2 segundos para apagar condici�n alive.
				{
					estado = ESTADO_FIN;
				}
				else
				{
					// apagarLeds();
					actualizarLeds(notif, CMD_BATERIA); // Enciende el led Azul central.
					estado = ESTADO_NOTIFICACION;
				}
			}
			else if (notif == COND_INIT_ADMIN)
			{
				estado = ESTADO_NOTIFICACION;

				if (cont_tim2 < 5)
				{
					if (flag_tim2)
					{
						actualizarLeds(7, CMD_RECARGA); // Tres primeros leds azules.
					}
					else if (!flag_tim2)
					{
						actualizarLeds(24, CMD_BATERIA); // Dos �ltimos leds rojos
					}
				}
				else if (cont_tim2 >= 5)
				{
					estado = ESTADO_FIN;
				}
			}
			else if (notif == COND_END_ADMIN)
			{
				estado = ESTADO_FIN;
			}
			if (flag_recibir)
			{
				apagarLeds();
				flag_boton = FALSE;
				cont_tim2 = 0;
				estado = ESTADO_RECIBIR;
			}
			break;
		}
		case (ESTADO_INICIO):
		{
			uint8_t valor_inicio = Slave_Buffer_Rx[1];

			refrescarIWDG();

			actualizarLeds(27, CMD_RECARGA);
			actualizarLeds(27, CMD_BATERIA);

			if (valor_inicio == COND_BOOT_INIT)
			{
				if ((cont_tim2 > 3) && (cont_tim2 <= 4))
				{
					apagarBuzzer();

					estado = ESTADO_INICIO;
				}
				else if (cont_tim2 < 2)
				{
					encenderBuzzer();
					estado = ESTADO_INICIO;
				}
				else if (cont_tim2 > 4)
				{
					estado = ESTADO_FIN;
					main();
				}
			}
			else if (valor_inicio == COND_BOOT_STOP)
			{
				estado = ESTADO_FIN;
			}
			else if (valor_inicio == COND_MOSTRAR_RECARGA)
			{
				if (cont_tim2 > 1)
				{
					estado = ESTADO_FIN;
				}
				else
				{
					apagarLeds();
					encenderBuzzer();
					actualizarLeds((1 << leerEEPROM(ADDR_RECARGA)) - 1, CMD_RECARGA);
					estado = ESTADO_INICIO;
				}
			}
			break;
		}
		case (ESTADO_WARNING):
		{
			refrescarIWDG();
			if ((flag_boton == TRUE) || (cont_tim2 > TOUT_ALARMA))
			{
				apagarBuzzer();
				estado = ESTADO_FIN;
			}
			else if ((cont_tim2 <= TOUT_ALARMA))
			{
				apagarLeds();
				actualizarLeds(alarma_init, CMD_RECARGA); // Visualizar warnings.
				// Cada 3s enciende, apaga 1 s
				if (cont_tim2 % 2 != 0)
				{
					encenderBuzzer();
				}
				else
				{
					apagarBuzzer();
				}
				estado = ESTADO_WARNING;
			}
			if (flag_recibir)
			{
				apagarLeds();
				flag_boton = FALSE;
				cont_tim2 = 0;
				estado = ESTADO_RECIBIR;
			}
			break;
		}
		case (ESTADO_FIN):
		{
			refrescarIWDG();
			inicializar();
			break;
		}
		default:
		{
			break;
		}
		}
	}
}

void apagarLeds(void)
{
	actualizarLeds(0, CMD_BATERIA);
	actualizarLeds(0, CMD_RECARGA);
}

void inicializar(void)
{
	// TIM2_Cmd(DISABLE);
	TIM1_Cmd(DISABLE);
	TIM1_setup();
	apagarLeds();
	apagarBuzzer();
	cont_tim2 = 0;
	cont_restart = 0;
	cont_ruleta = 0;
	contPulsos = 1;
	contReinicio = 1;
	contHist = 1;
	flag_boton = FALSE;
	flag_buzzer = FALSE;
	flag_recibir = FALSE;
	flag_historicos = FALSE;
	flag_notificacion = FALSE;
	flag_reinicio = FALSE;
	estado = ESTADO_ESPERAR;
}

void encenderBuzzer(void)
{
	if (flag_buzzer == TRUE)
	{
		GPIO_WriteHigh(GPIOA, BUZZER);
	}
	else
	{
		apagarBuzzer();
	}
}

void apagarBuzzer(void)
{
	GPIO_WriteLow(GPIOA, BUZZER);
}

void actualizarLeds(uint8_t valor, uint8_t cmd)
{
	uint8_t posicion = 0;
	int i = 0;
	for (i = 0; i < 5; i++)
	{
		arrayBinario[i] = valor % 2;
		valor = valor / 2;
		posicion = i + 1;
		refrescarLed(posicion, arrayBinario[i], cmd);
		arrayBinario[i] = 0;
	}
}

void refrescarLed(uint8_t posicion, uint8_t estadoLed, uint8_t cmd)
{
	switch (posicion)
	{
	case (1):
	{
		if (estadoLed == 1)
		{
			if (cmd == CMD_BATERIA)
			{
				onBD1();
			}
			else if (cmd == CMD_RECARGA)
			{
				onGD1();
			}
		}
		else if (estadoLed == 0)
		{
			if (cmd == CMD_BATERIA)
			{
				offBD1();
			}
			else if (cmd == CMD_RECARGA)
			{
				offGD1();
			}
		}
		break;
	}
	case (2):
	{
		if (estadoLed == 1)
		{
			if (cmd == CMD_BATERIA)
			{
				onBD2();
			}
			else if (cmd == CMD_RECARGA)
			{
				onGD2();
			}
		}
		else if (estadoLed == 0)
		{
			if (cmd == CMD_BATERIA)
			{
				offBD2();
			}
			else if (cmd == CMD_RECARGA)
			{
				offGD2();
			}
		}
		break;
	}
	case (3):
	{
		if (estadoLed == 1)
		{
			if (cmd == CMD_BATERIA)
			{
				onBD3();
			}
			else if (cmd == CMD_RECARGA)
			{
				onGD3();
			}
		}
		else if (estadoLed == 0)
		{
			if (cmd == CMD_BATERIA)
			{
				offBD3();
			}
			else if (cmd == CMD_RECARGA)
			{
				offGD3();
			}
		}
		break;
	}
	case (4):
	{
		if (estadoLed == 1)
		{
			if (cmd == CMD_BATERIA)
			{
				onBD4();
			}
			else if (cmd == CMD_RECARGA)
			{
				onGD4();
			}
		}
		else if (estadoLed == 0)
		{
			if (cmd == CMD_BATERIA)
			{
				offBD4();
			}
			else if (cmd == CMD_RECARGA)
			{
				offGD4();
			}
		}
		break;
	}
	case (5):
	{
		if (estadoLed == 1)
		{
			if (cmd == CMD_BATERIA)
			{
				onBD5();
			}
			else if (cmd == CMD_RECARGA)
			{
				onGD5();
			}
		}
		else if (estadoLed == 0)
		{
			if (cmd == CMD_BATERIA)
			{
				offBD5();
			}
			else if (cmd == CMD_RECARGA)
			{
				offGD5();
			}
		}
		break;
	}
	default:
	{
		break;
	}
	}
}

void guardarAlarma()
{
	a5 = leerEEPROM(ADDR_BASE + 4); // Leer A4 y actualizarla en A5
	actualizarEEPROM(ADDR_BASE + 5, a5);
	a4 = leerEEPROM(ADDR_BASE + 3); // Leer A3 y actualizarla en A4
	actualizarEEPROM(ADDR_BASE + 4, a4);
	a3 = leerEEPROM(ADDR_BASE + 2); // Leer A2 y actualizarla en A3
	actualizarEEPROM(ADDR_BASE + 3, a3);
	a2 = leerEEPROM(ADDR_BASE + 1); // Leer A1 y actualizarla en A2
	actualizarEEPROM(ADDR_BASE + 2, a2);
	a1 = alarma; // Actualizar A1
	actualizarEEPROM(ADDR_BASE + 1, a1);
}

void leerAlarma()
{
	a_EE = leerEEPROM(ADDR_BASE + contHist);
	actualizarLeds(a_EE, CMD_RECARGA);
}

void refrescarIWDG()
{
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
	IWDG_ReloadCounter();
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Disable);
}

void sinSaldo(void)
{
	apagarLeds();
	actualizarLeds(21, CMD_BATERIA);
	actualizarLeds(10, CMD_RECARGA);

	if ((cont_tim2 >= 1 && cont_tim2 < 2) || (cont_tim2 > (UMBRAL_CONTEO - 1) && cont_tim2 <= UMBRAL_CONTEO))
	{
		encenderBuzzer();
	}
	else
	{
		apagarBuzzer();
	}
}

void signalStatus(bool estado)
{
	if (estado)
	{
		actualizarLeds(14, CMD_RECARGA);
	}
	else
	{
		actualizarLeds(14, CMD_BATERIA);
	}

	if ((cont_tim2 > 1 && cont_tim2 <= 2) || (cont_tim2 > (TIME_STATUS - 1)) && (cont_tim2 <= TIME_STATUS))
	{
		encenderBuzzer();
	}
	else
	{
		apagarBuzzer();
	}

	if (cont_tim2 >= TIME_STATUS)
	{
		estado = ESTADO_FIN;
	}
	else if (cont_tim2 < TIME_STATUS)
	{
		estado = ESTADO_NOTIFICACION;
	}
}