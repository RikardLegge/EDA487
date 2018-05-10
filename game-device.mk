##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=game-device
ConfigurationName      :=Debug
WorkspacePath          :=/Users/ria/Documents/clectures
ProjectPath            :=/Users/ria/Documents/Chalmers/Emulator/moppen-game
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Ria Raj
Date                   :=10/05/2018
CodeLitePath           :="/Users/ria/Library/Application Support/CodeLite"
LinkerName             :=$(GccArmDir)/bin/arm-none-eabi-c++
SharedObjectLinkerName :=$(GccArmDir)/bin/arm-none-eabi-c++ -shared -fPIC
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
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).elf
Preprocessors          :=$(PreprocessorSwitch)FIXMATH_NO_CACHE=1 $(PreprocessorSwitch)FIXMATH_NO_64BIT=1 $(PreprocessorSwitch)FIXMATH_FAST_SIN=1 $(PreprocessorSwitch)FIXMATH_OPTIMIZE_8BIT=1 
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="game-device.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -T$(ProjectPath)/md407-ram.x -L$(ARM_V6LIB) -L$(ARM_GCC_V6LIB) -nostdlib 
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)gcc $(LibrarySwitch)c_nano 
ArLibs                 :=  "gcc" "c_nano" 
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := $(GccArmDir)/arm-none-eabi/bin/ar rcu
CXX      := $(GccArmDir)/bin/arm-none-eabi-c++
CC       := $(GccArmDir)/bin/arm-none-eabi-gcc
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O1 -mthumb -Wall -march=armv6-m -Wa,-adhln=test.s -msoft-float  $(Preprocessors)
ASFLAGS  := 
AS       := $(GccArmDir)/arm-none-eabi/bin/as


##
## User defined environment variables
##
CodeLiteDir:=/Applications/codelite.app/Contents/SharedSupport
GccArmDir:=$(CodeLiteDir)/tools/gcc-arm
CustomGccArmDir:=$(GccArmDir)
ARM_V6LIB:=$(GccArmDir)/arm-none-eabi/lib/thumb/v6-m
ARM_GCC_V6LIB:=$(GccArmDir)/lib/gcc/arm-none-eabi/7.2.1/thumb/v6-m
ARM_M4FPLIB:=$(GccArmDir)/arm-none-eabi/lib/thumb/v7e-m/fpv4-sp/hard
ARM_GCC_M4FPLIB:=$(GccArmDir)/lib/gcc/arm-none-eabi/7.2.1/thumb/v7e-m
Objects0=$(IntermediateDirectory)/device_device_runtime.c$(ObjectSuffix) $(IntermediateDirectory)/shared_sprite.c$(ObjectSuffix) $(IntermediateDirectory)/shared_vector_drawing.c$(ObjectSuffix) $(IntermediateDirectory)/shared_canvas.c$(ObjectSuffix) $(IntermediateDirectory)/shared_util.c$(ObjectSuffix) $(IntermediateDirectory)/device_main.c$(ObjectSuffix) $(IntermediateDirectory)/shared_game.c$(ObjectSuffix) 



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

PostBuild:
	@echo Executing Post Build commands ...
	/Applications/codelite.app/Contents/SharedSupport/tools/gcc-arm/arm-none-eabi/bin/objcopy -S -O srec  ./Debug/game-device.elf ./Debug/game-device.s19
	/Applications/codelite.app/Contents/SharedSupport/tools/gcc-arm/arm-none-eabi/bin/objdump -D -S ./Debug/game-device.elf > ./Debug/game-device.dass
	@echo Done

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/device_device_runtime.c$(ObjectSuffix): device/device_runtime.c $(IntermediateDirectory)/device_device_runtime.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/ria/Documents/Chalmers/Emulator/moppen-game/device/device_runtime.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_device_runtime.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/device_device_runtime.c$(DependSuffix): device/device_runtime.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/device_device_runtime.c$(ObjectSuffix) -MF$(IntermediateDirectory)/device_device_runtime.c$(DependSuffix) -MM device/device_runtime.c

$(IntermediateDirectory)/device_device_runtime.c$(PreprocessSuffix): device/device_runtime.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/device_device_runtime.c$(PreprocessSuffix) device/device_runtime.c

$(IntermediateDirectory)/shared_sprite.c$(ObjectSuffix): shared/sprite.c $(IntermediateDirectory)/shared_sprite.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/sprite.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_sprite.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_sprite.c$(DependSuffix): shared/sprite.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_sprite.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_sprite.c$(DependSuffix) -MM shared/sprite.c

$(IntermediateDirectory)/shared_sprite.c$(PreprocessSuffix): shared/sprite.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_sprite.c$(PreprocessSuffix) shared/sprite.c

$(IntermediateDirectory)/shared_vector_drawing.c$(ObjectSuffix): shared/vector_drawing.c $(IntermediateDirectory)/shared_vector_drawing.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/vector_drawing.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_vector_drawing.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_vector_drawing.c$(DependSuffix): shared/vector_drawing.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_vector_drawing.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_vector_drawing.c$(DependSuffix) -MM shared/vector_drawing.c

$(IntermediateDirectory)/shared_vector_drawing.c$(PreprocessSuffix): shared/vector_drawing.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_vector_drawing.c$(PreprocessSuffix) shared/vector_drawing.c

$(IntermediateDirectory)/shared_canvas.c$(ObjectSuffix): shared/canvas.c $(IntermediateDirectory)/shared_canvas.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/canvas.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_canvas.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_canvas.c$(DependSuffix): shared/canvas.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_canvas.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_canvas.c$(DependSuffix) -MM shared/canvas.c

$(IntermediateDirectory)/shared_canvas.c$(PreprocessSuffix): shared/canvas.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_canvas.c$(PreprocessSuffix) shared/canvas.c

$(IntermediateDirectory)/shared_util.c$(ObjectSuffix): shared/util.c $(IntermediateDirectory)/shared_util.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/util.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_util.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_util.c$(DependSuffix): shared/util.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_util.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_util.c$(DependSuffix) -MM shared/util.c

$(IntermediateDirectory)/shared_util.c$(PreprocessSuffix): shared/util.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_util.c$(PreprocessSuffix) shared/util.c

$(IntermediateDirectory)/device_main.c$(ObjectSuffix): device/main.c $(IntermediateDirectory)/device_main.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/ria/Documents/Chalmers/Emulator/moppen-game/device/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_main.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/device_main.c$(DependSuffix): device/main.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/device_main.c$(ObjectSuffix) -MF$(IntermediateDirectory)/device_main.c$(DependSuffix) -MM device/main.c

$(IntermediateDirectory)/device_main.c$(PreprocessSuffix): device/main.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/device_main.c$(PreprocessSuffix) device/main.c

$(IntermediateDirectory)/shared_game.c$(ObjectSuffix): shared/game.c $(IntermediateDirectory)/shared_game.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/ria/Documents/Chalmers/Emulator/moppen-game/shared/game.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_game.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_game.c$(DependSuffix): shared/game.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_game.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_game.c$(DependSuffix) -MM shared/game.c

$(IntermediateDirectory)/shared_game.c$(PreprocessSuffix): shared/game.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_game.c$(PreprocessSuffix) shared/game.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


