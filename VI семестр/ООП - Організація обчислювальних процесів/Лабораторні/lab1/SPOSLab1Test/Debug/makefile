################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: SPOSLab1Test

dependents:
	-cd /home/nightmaresseller/Projects/Eclipse\ Projects/SPOSLab1/Debug && $(MAKE) all

# Tool invocations
SPOSLab1Test: $(OBJS) $(USER_OBJS) /home/nightmaresseller/Projects/Eclipse\ Projects/SPOSLab1/Debug/libSPOSLab1.a
	@echo 'Building target: $@'
	@echo 'Invoking: GCC C++ Linker'
	g++ -L"/home/nightmaresseller/Projects/Eclipse Projects/SPOSLab1/Debug" -o "SPOSLab1Test" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C++_DEPS)$(C_DEPS)$(CC_DEPS)$(CPP_DEPS)$(EXECUTABLES)$(CXX_DEPS)$(C_UPPER_DEPS) SPOSLab1Test
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:
/home/nightmaresseller/Projects/Eclipse\ Projects/SPOSLab1/Debug/libSPOSLab1.a:

-include ../makefile.targets
