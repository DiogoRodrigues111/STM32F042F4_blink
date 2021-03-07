//------------------------------------------------------------------------------
#define GPIOA             0x40020010
#define ADDED_FLAGS       (*(volatile unsigned long *)GPIOA)
#define PUT_IN_FLAGS      ADDED_FLAGS
#define PORTPA0_SUCCESS   PUT_IN_FLAGS
//------------------------------------------------------------------------------
#define GPIO_PA4_SPI      0x40020414
#define PA4_SPI_FLAGS     (*(volatile unsigned long *)GPIO_PA4_SPI)
#define PUT_SPI_PA4       PA4_SPI_FLAGS
#define PA4_SPI_SUCCESS   PUT_SPI_PA4
//------------------------------------------------------------------------------
#define ADC1              0x40012018
#define ADDED_ADC1_FLAGS  (*(volatile unsigned long *)ADC1)
#define PUT_IN_ADC1_FLAGS ADDED_ADC1_FLAGS
#define ADC1_SUCCESS      PUT_IN_ADC1_FLAGS
//------------------------------------------------------------------------------

unsigned short make_delay_ms(long ms) {
  long a,b;
  for(a=0; a<65000; a++)
   for(b=0;b<ms; b++)
    ;
  return (unsigned int)ms;
}

void main() {
  while(1) {
    PORTPA0_SUCCESS = 0x01;
    make_delay_ms(1000);
    PORTPA0_SUCCESS = 0x00;
    make_delay_ms(1000);
  }
}