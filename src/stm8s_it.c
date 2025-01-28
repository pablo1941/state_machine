/**
  ******************************************************************************
  * @file    stm8s_it.c
  * @author  MCD Application Team
  * @version V2.3.0
  * @date    16-June-2017
  * @brief   Main Interrupt Service Routines.
  *          This file provides template for all peripherals interrupt service 
  *          routine.
   ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */ 
/* Includes ------------------------------------------------------------------*/
//#include "stm8s.h"
#include "stm8s_it.h"

/** @addtogroup Template_Project
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/

extern volatile bool flag_boton      ;
extern volatile bool flag_alarma     ;
extern volatile bool flag_buzzer     ;
extern volatile bool flag_recibir    ;
extern volatile bool flag_historicos ;
extern volatile bool flag_tim2;
extern volatile int cont_tim2;
extern volatile int cont_restart;
extern volatile uint8_t cont_ruleta;
extern volatile uint8_t contPulsos ;
extern volatile uint8_t contReinicio ;

extern volatile bool flag_reinicio;

extern volatile uint8_t contHist;

extern volatile uint8_t Slave_Buffer_Rx[2];
extern uint8_t Tx_Idx = 0, Rx_Idx = 0;
uint16_t Event = 0x00;
extern uint8_t cont_bytes = 0;
extern const uint8_t N_BYTES = 2;
uint8_t aux = 0;


/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

#ifdef _COSMIC_
/**
  * @brief Dummy Interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
INTERRUPT_HANDLER(NonHandledInterrupt, 25)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*_COSMIC_*/

/**
  * @brief Auto Wake Up Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(AWU_IRQHandler, 1)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
/**
  * @brief External Interrupt PORTD Interrupt routine.
  * @param  None
  * @retval None
  */
void EXTI3_IRQHandler(void)
{ 
  // int j;
  // for (j = 0 ; j < 32000; j++);
  disableInterrupts();

  if(flag_boton == TRUE )
  {
    flag_boton = FALSE;
  }
  else
  {    
    flag_boton = TRUE;  
  }   

  // TIM2_Cmd(ENABLE);
  // if(cont_tim2 > 2)
  // {
  //   flag_historicos = TRUE;
  //   return;
  // }

  if(contPulsos == 3)
  {
    flag_historicos = TRUE;
    contPulsos = 0;
    //return;
  }
  else if( contPulsos < 3)
  {
    contPulsos++;
  }

  if (contReinicio < 5)
  {
    contReinicio++;    
  }
  else if(contReinicio == 5)
  {    
    contReinicio = 0; 
    flag_reinicio = TRUE;   
  }



  enableInterrupts();
}
/**
  * @brief Timer1 Update/Overflow/Trigger/Break Interrupt routine.
  * @param  None
  * @retval None
  */
void TIM1_UPD_IRQHandler(void)
{
  TIM1_ClearITPendingBit(TIM1_IT_UPDATE); 
  //TIM1_ClearFlag(TIM1_FLAG_UPDATE);
  flag_buzzer ^= 1; 
}

#if defined (STM8S903) || defined (STM8AF622x)
#else /* (STM8S208) || (STM8S207) || (STM8S105) || (STM8S103) || (STM8AF62Ax) || (STM8AF52Ax) || (STM8AF626x) */
/**
  * @brief Timer2 Update/Overflow/Break Interrupt routine.
  * @param  None
  * @retval None
  */
void TIM2_UPD_IRQHandler(void)
{
	flag_tim2^=1;
	TIM2_ClearFlag(TIM2_FLAG_UPDATE);	
	cont_tim2++;
  cont_restart++;
  if(cont_ruleta <= 5 )
  {         
    cont_ruleta++;
  }
  else if(cont_ruleta > 5)
  {
    cont_ruleta = 0;
  }


  if (cont_tim2%4 == 0)
  {
    contHist++;
  }
  else if (cont_tim2 == 21)
  {
    flag_historicos = FALSE;
    contHist=1;
  }
}
#endif /* (STM8S903) || (STM8AF622x) */

/**
  * @brief I2C Interrupt routine.
  * @param  None
  * @retval None
  */
void I2C_ReceiverIRQHandler(void)
{	
	// uint8_t aux = 0;
	//   /* Read SR2 register to get I2C error */
  // if ((I2C->SR2) != 0)
  // {
	// 	//GPIO_WriteHigh(GPIOC, GD2);
	// 	//GPIO_WriteLow(GPIOC, BD2);
  //   /* Clears SR2 register */
  //   I2C->SR2 = 0;
  // }
	
  // Event = I2C_GetLastEvent();
  // switch (Event)
  // {
  //     /******* Slave transmitter ******/
  //     /* check on EV1 */
  //   case I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED:
  //     //Tx_Idx = 0;
  //     break;

  //     /* check on EV3 */
  //   case I2C_EVENT_SLAVE_BYTE_TRANSMITTING:
  //     /* Transmit data */
  //     //I2C_SendData(Slave_Buffer_Rx[Tx_Idx++]);
  //     break;
  //     /******* Slave receiver **********/
  //     /* check on EV1*/
  //   case I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED:
	// 	{
	// 		//GPIO_WriteHigh(GPIOD, GD1);
	// 		//GPIO_WriteLow(GPIOD, BD1);	
	// 		I2C_AcknowledgeConfig(ENABLE);			
  //     break;
	// 	}
  //     /* Check on EV2*/
  //   case I2C_EVENT_SLAVE_BYTE_RECEIVED:
	// 	{			
	// 		I2C_AcknowledgeConfig(DISABLE);
	// 					//GPIO_WriteHigh(GPIOD, GD5);
	// 					//GPIO_WriteLow(GPIOD, BD5);
	// 					aux= I2C_ReceiveData();
	// 		      Slave_Buffer_Rx[cont_bytes] 	= aux;					
	// 		I2C_AcknowledgeConfig(ENABLE);
			
	// 		if(cont_bytes != (N_BYTES-1))
	// 		{
	// 			cont_bytes++;		
	// 		}
	// 		else if(cont_bytes == (N_BYTES-1))
	// 		{
	// 			flag_recibir = TRUE;
	// 			cont_bytes=0;		
	// 		}	
	// 	break;
	// 	}
  //     /* Check on EV4 */
  //   case (I2C_EVENT_SLAVE_STOP_DETECTED):
  //           /* write to CR2 to clear STOPF flag */
  //           I2C->CR2 |= I2C_CR2_ACK;
  //     break;

	// 	default:{break;}
	// }

}
/**
  * @brief Eeprom EEC Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @}
  */

void UART_RX_IRQHandler(void )
{
  uint8_t aux = 0;

  aux = UART1_ReceiveData8();
  
  UART1_ClearITPendingBit(UART1_IT_RXNE);
  UART1_ClearFlag(UART1_FLAG_RXNE);

  Slave_Buffer_Rx[cont_bytes] 	= aux;

  if(cont_bytes != (N_BYTES-1))
  {
    cont_bytes++;		
  }
  else if(cont_bytes == (N_BYTES-1))
  {
    flag_recibir = TRUE;
    cont_bytes=0;		
  }	  
}
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/