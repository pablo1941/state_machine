/**
  ******************************************************************************
  * @file    stm8s_gpio.c
  * @author  MCD Application Team
  * @version V2.3.0
  * @date    16-June-2017
  * @brief   This file contains all the functions for the GPIO peripheral.
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
#include "stm8s_gpio.h"

/** @addtogroup STM8S_StdPeriph_Driver
  * @{
  */
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/

/**
  * @addtogroup GPIO_Public_Functions
  * @{
  */

/**
  * @brief  Deinitializes the GPIOx peripheral registers to their default reset values.
  * @param  GPIOx: Select the GPIO peripheral number (x = A to I).
  * @retval None
  */
void GPIO_DeInit(GPIO_TypeDef* GPIOx)
{
  GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
  GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
  GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
  GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
}

/**
  * @brief  Initializes the GPIOx according to the specified parameters.
  * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param  GPIO_Pin : This parameter contains the pin number, it can be any value
  *         of the @ref GPIO_Pin_TypeDef enumeration.
  * @param  GPIO_Mode : This parameter can be a value of the
  *         @ref GPIO_Mode_TypeDef enumeration.
  * @retval None
  */

void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
{
  /*----------------------*/
  /* Check the parameters */
  /*----------------------*/
  
  assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
  assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
  
  /* Reset corresponding bit to GPIO_Pin in CR2 register */
  GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
  
  /*-----------------------------*/
  /* Input/Output mode selection */
  /*-----------------------------*/
  
  if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
  {
    if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
    {
      GPIOx->ODR |= (uint8_t)GPIO_Pin;
    } 
    else /* Low level */
    {
      GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
    }
    /* Set Output mode */
    GPIOx->DDR |= (uint8_t)GPIO_Pin;
  } 
  else /* Input mode */
  {
    /* Set Input mode */
    GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
  }
  
  /*------------------------------------------------------------------------*/
  /* Pull-Up/Float (Input) or Push-Pull/Open-Drain (Output) modes selection */
  /*------------------------------------------------------------------------*/
  
  if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
  {
    GPIOx->CR1 |= (uint8_t)GPIO_Pin;
  } 
  else /* Float or Open-Drain */
  {
    GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
  }
  
  /*-----------------------------------------------------*/
  /* Interrupt (Input) or Slope (Output) modes selection */
  /*-----------------------------------------------------*/
  
  if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
  {
    GPIOx->CR2 |= (uint8_t)GPIO_Pin;
  } 
  else /* No external interrupt or No slope control */
  {
    GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
  }
}

/**
  * @brief  Writes data to the specified GPIO data port.
  * @note   The port must be configured in output mode.
  * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param  PortVal : Specifies the value to be written to the port output
  *         data register.
  * @retval None
  */
void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
{
  GPIOx->ODR = PortVal;
}

/**
  * @brief  Writes high level to the specified GPIO pins.
  * @note   The port must be configured in output mode.  
  * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param  PortPins : Specifies the pins to be turned high to the port output.
  *         data register.
  * @retval None
  */
void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
{
  GPIOx->ODR |= (uint8_t)PortPins;
}

/**
  * @brief  Writes low level to the specified GPIO pins.
  * @note   The port must be configured in output mode.  
  * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param  PortPins : Specifies the pins to be turned low to the port output.
  *         data register.
  * @retval None
  */
void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
{
  GPIOx->ODR &= (uint8_t)(~PortPins);
}

/**
  * @brief  Writes reverse level to the specified GPIO pins.
  * @note   The port must be configured in output mode.
  * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param  PortPins : Specifies the pins to be reversed to the port output.
  *         data register.
  * @retval None
  */
void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
{
  GPIOx->ODR ^= (uint8_t)PortPins;
}

/**
  * @brief  Reads the specified GPIO output data port.
  * @note   The port must be configured in input mode.  
  * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
  * @retval GPIO output data port value.
  */
uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
{
  return ((uint8_t)GPIOx->ODR);
}

/**
  * @brief  Reads the specified GPIO input data port.
  * @note   The port must be configured in input mode.   
  * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
  * @retval GPIO input data port value.
  */
uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
{
  return ((uint8_t)GPIOx->IDR);
}

/**
  * @brief  Reads the specified GPIO input data pin.
  * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param  GPIO_Pin : Specifies the pin number.
  * @retval BitStatus : GPIO input pin status.
  */
BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
{
  return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
}

/**
  * @brief  Configures the external pull-up on GPIOx pins.
  * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
  * @param  GPIO_Pin : Specifies the pin number
  * @param  NewState : The new state of the pull up pin.
  * @retval None
  */
void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
{
  /* Check the parameters */
  assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));
  
  if (NewState != DISABLE) /* External Pull-Up Set*/
  {
    GPIOx->CR1 |= (uint8_t)GPIO_Pin;
  } else /* External Pull-Up Reset*/
  {
    GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
  }
}

/**
  * @}
  */
  
/**
  * @}
  */
void conf_GPIO(void)
{
	GPIO_DeInit(GPIOA);
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOD);	
/* Configurar Rele como salida e interruptor como entrada*/
	GPIO_Init(GPIOA, BUZZER, GPIO_MODE_OUT_PP_LOW_FAST);	
	GPIO_Init(GPIOD, BOTON, GPIO_MODE_IN_PU_IT);	
	
// /* Configurar pines puerto B para SDA y SCLK*/
// 	GPIO_Init(GPIOB, SCLK, GPIO_MODE_OUT_OD_HIZ_FAST);
// 	GPIO_Init(GPIOB, SDA, GPIO_MODE_OUT_OD_HIZ_FAST);

/* Configuracion del serial */
  GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT);

  GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_SLOW);
  GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_SLOW);
/* Configurar pines Puerto D 5-6 como TX-RX Serial.*/
	
/* Inicializar los puertos B, C y D como salidas */
 
  GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)PINESO_PORTC, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)PINESO_PORTD, GPIO_MODE_OUT_PP_LOW_FAST);
  //GPIO_Init(GPIOB, (GPIO_Pin_TypeDef)PINESO_PORTB, GPIO_MODE_OUT_PP_LOW_FAST);
	
/* Inicializar puertos de los LEDs*/
	GPIO_WriteLow(GPIOD,(GPIO_Pin_TypeDef)PINESO_PORTD);
	GPIO_WriteLow(GPIOC,(GPIO_Pin_TypeDef)PINESO_PORTC);	
  GPIO_WriteLow(GPIOB,(GPIO_Pin_TypeDef)PINESO_PORTB);  
}  

void onBD1 (void){GPIO_WriteHigh(GPIOB, BD1);}
void onBD2 (void){GPIO_WriteHigh(GPIOC, BD2);}
void onBD3 (void){GPIO_WriteHigh(GPIOC, BD3);}
void onBD4 (void){GPIO_WriteHigh(GPIOD, BD4);}
void onBD5 (void){GPIO_WriteHigh(GPIOD, BD5);}

void offBD1 (void){GPIO_WriteLow(GPIOB, BD1);}
void offBD2 (void){GPIO_WriteLow(GPIOC, BD2);}
void offBD3 (void){GPIO_WriteLow(GPIOC, BD3);}
void offBD4 (void){GPIO_WriteLow(GPIOD, BD4);}
void offBD5 (void){GPIO_WriteLow(GPIOD, BD5);}

void onGD1 (void){GPIO_WriteHigh(GPIOB, GD1);}
void onGD2 (void){GPIO_WriteHigh(GPIOC, GD2);}
void onGD3 (void){GPIO_WriteHigh(GPIOC, GD3);}
void onGD4 (void){GPIO_WriteHigh(GPIOC, GD4);}
void onGD5 (void){GPIO_WriteHigh(GPIOD, GD5);}

void offGD1 (void){GPIO_WriteLow(GPIOB, GD1);}
void offGD2 (void){GPIO_WriteLow(GPIOC, GD2);}
void offGD3 (void){GPIO_WriteLow(GPIOC, GD3);}
void offGD4 (void){GPIO_WriteLow(GPIOC, GD4);}
void offGD5 (void){GPIO_WriteLow(GPIOD, GD5);}
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
