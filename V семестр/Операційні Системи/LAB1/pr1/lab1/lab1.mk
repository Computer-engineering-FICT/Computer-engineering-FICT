##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=lab1
ConfigurationName      :=Debug
WorkspacePath          :=D:/CMAKE/PROJECTS/pr1
ProjectPath            :=D:/CMAKE/PROJECTS/pr1/lab1
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=local
Date                   :=01/10/2017
CodeLitePath           :=D:/CMAKE/CodeLite
LinkerName             :=D:/CMAKE/TDM-GCC/bin/g++.exe
SharedObjectLinkerName :=D:/CMAKE/TDM-GCC/bin/g++.exe -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="lab1.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :=D:/CMAKE/TDM-GCC/bin/windres.exe
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := D:/CMAKE/TDM-GCC/bin/ar.exe rcu
CXX      := D:/CMAKE/TDM-GCC/bin/g++.exe
CC       := D:/CMAKE/TDM-GCC/bin/gcc.exe
CXXFLAGS :=  -g -O0 -std=c++11 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := D:/CMAKE/TDM-GCC/bin/as.exe


##
## User defined environment variables
##
CodeLiteDir:=D:\CMAKE\CodeLite
Objects0=$(IntermediateDirectory)/main.cpp$(ObjectSuffix) $(IntermediateDirectory)/alloc.cpp$(ObjectSuffix) $(IntermediateDirectory)/auto_test.cpp$(ObjectSuffix) $(IntermediateDirectory)/debug.cpp$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@$(MakeDirCommand) "./Debug"


$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/main.cpp$(ObjectSuffix): main.cpp $(IntermediateDirectory)/main.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "D:/CMAKE/PROJECTS/pr1/lab1/main.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.cpp$(DependSuffix): main.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/main.cpp$(DependSuffix) -MM main.cpp

$(IntermediateDirectory)/main.cpp$(PreprocessSuffix): main.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.cpp$(PreprocessSuffix) main.cpp

$(IntermediateDirectory)/alloc.cpp$(ObjectSuffix): alloc.cpp $(IntermediateDirectory)/alloc.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "D:/CMAKE/PROJECTS/pr1/lab1/alloc.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/alloc.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/alloc.cpp$(DependSuffix): alloc.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/alloc.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/alloc.cpp$(DependSuffix) -MM alloc.cpp

$(IntermediateDirectory)/alloc.cpp$(PreprocessSuffix): alloc.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/alloc.cpp$(PreprocessSuffix) alloc.cpp

$(IntermediateDirectory)/auto_test.cpp$(ObjectSuffix): auto_test.cpp $(IntermediateDirectory)/auto_test.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "D:/CMAKE/PROJECTS/pr1/lab1/auto_test.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/auto_test.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/auto_test.cpp$(DependSuffix): auto_test.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/auto_test.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/auto_test.cpp$(DependSuffix) -MM auto_test.cpp

$(IntermediateDirectory)/auto_test.cpp$(PreprocessSuffix): auto_test.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/auto_test.cpp$(PreprocessSuffix) auto_test.cpp

$(IntermediateDirectory)/debug.cpp$(ObjectSuffix): debug.cpp $(IntermediateDirectory)/debug.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "D:/CMAKE/PROJECTS/pr1/lab1/debug.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/debug.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/debug.cpp$(DependSuffix): debug.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/debug.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/debug.cpp$(DependSuffix) -MM debug.cpp

$(IntermediateDirectory)/debug.cpp$(PreprocessSuffix): debug.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/debug.cpp$(PreprocessSuffix) debug.cpp


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


