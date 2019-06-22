################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../mem_alloc/mem_alloc.c \
../mem_alloc/mem_rb_tree.c \
../mem_alloc/mem_types.c 

OBJS += \
./mem_alloc/mem_alloc.o \
./mem_alloc/mem_rb_tree.o \
./mem_alloc/mem_types.o 

C_DEPS += \
./mem_alloc/mem_alloc.d \
./mem_alloc/mem_rb_tree.d \
./mem_alloc/mem_types.d 


# Each subdirectory must supply rules for building sources it contributes
mem_alloc/%.o: ../mem_alloc/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -std=gnu11 -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


