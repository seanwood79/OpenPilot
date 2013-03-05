BOARD_TYPE          := 0x04
BOARD_REVISION      := 0x02
BOOTLOADER_VERSION  := 0x03
HW_TYPE             := 0x01

MCU                 := cortex-m3
# Target MCU upper and lowercase names
TARGETMCU           := STM32F10x
TARGETMCUL          := stm32f10x
# Name and Version of the Std Periph Library
STDPERLIB           := STM32F10x_StdPeriph_Lib_
STDPLVER            := V3.5.0
CHIP                := STM32F103CBT
BOARD               := STM32103CB_CC_Rev1
MODEL               := MD
MODEL_SUFFIX        := _CC

# RTOS Selection for this board
RTOS                := FreeRTOS
RTOSVER             := UNKONOWN
CMSIS               := CMSIS
CMSISVER            := 2
# Cryptic name due to length, CMSIS VENDOR and VERSION
CMVEN               := UNKNOWN
CMVENVER            := UNKNOWN


OPENOCD_JTAG_CONFIG := foss-jtag.revb.cfg
OPENOCD_CONFIG      := stm32f1x.cfg

# Note: These must match the values in link_$(BOARD)_memory.ld
BL_BANK_BASE        := 0x08000000  # Start of bootloader flash
BL_BANK_SIZE        := 0x00003000  # Should include BD_INFO region
FW_BANK_BASE        := 0x08003000  # Start of firmware flash
FW_BANK_SIZE        := 0x0001D000  # Should include FW_DESC_SIZE

FW_DESC_SIZE        := 0x00000064
