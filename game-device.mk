##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=game-device
ConfigurationName      :=Debug
WorkspacePath          :=/Users/legge/Development/moppen
ProjectPath            :=/Users/legge/Development/moppen-game
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Rikard Legge
Date                   :=06/05/2018
CodeLitePath           :="/Users/legge/Library/Application Support/CodeLite"
LinkerName             :=$(CodeLiteDir)/tools/gcc-arm-custom/bin/arm-none-eabi-g++
SharedObjectLinkerName :=$(CodeLiteDir)/tools/gcc-arm-custom/bin/arm-none-eabi-g++ -shared -fPIC
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
AR       := $(CodeLiteDir)/tools/gcc-arm-custom/bin/arm-none-eabi-ar rcu
CXX      := $(CodeLiteDir)/tools/gcc-arm-custom/bin/arm-none-eabi-g++
CC       := $(CodeLiteDir)/tools/gcc-arm-custom/bin/arm-none-eabi-gcc
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -mthumb -Wall -march=armv6-m -Wa,-adhln=test.s -msoft-float  $(Preprocessors)
ASFLAGS  := 
AS       := $(CodeLiteDir)/tools/gcc-arm-custom/bin/arm-none-eabi-as


##
## User defined environment variables
##
CodeLiteDir:=/Applications/codelite.app/Contents/SharedSupport/
CustomGccArmDir:=$(CodeLiteDir)tools/gcc-arm-custom/
GccArmDir:=$(CodeliteDir)/tools/gcc-arm
ARM_V6LIB:=$(GccArmDir)/arm-none-eabi/lib/thumb/v6-m
ARM_GCC_V6LIB:=$(GccArmDir)/lib/gcc/arm-none-eabi/7.2.1/thumb/v6-m
ARM_M4FPLIB:=$(GccArmDir)/arm-none-eabi/lib/thumb/v7e-m/fpv4-sp/hard
ARM_GCC_M4FPLIB:=$(GccArmDir)/lib/gcc/arm-none-eabi/7.2.1/thumb/v7e-m
Objects0=$(IntermediateDirectory)/shared_libfixmatrix_fixvector4d.c$(ObjectSuffix) $(IntermediateDirectory)/shared_libfixmatrix_fixvector3d.c$(ObjectSuffix) $(IntermediateDirectory)/shared_libfixmatrix_fixquat.c$(ObjectSuffix) $(IntermediateDirectory)/shared_libdivide_libdivide.c$(ObjectSuffix) $(IntermediateDirectory)/shared_libfixmath_fix16.c$(ObjectSuffix) $(IntermediateDirectory)/shared_libfixmath_fix16_sqrt.c$(ObjectSuffix) $(IntermediateDirectory)/shared_libfixmath_fix16_exp.c$(ObjectSuffix) $(IntermediateDirectory)/shared_sprite.c$(ObjectSuffix) $(IntermediateDirectory)/shared_libfixmatrix_fixarray.c$(ObjectSuffix) $(IntermediateDirectory)/shared_libfixmatrix_fixmatrix.c$(ObjectSuffix) \
	$(IntermediateDirectory)/device_main.c$(ObjectSuffix) $(IntermediateDirectory)/shared_libfixmatrix_fixvector2d.c$(ObjectSuffix) $(IntermediateDirectory)/shared_libfixmath_fix16_trig.c$(ObjectSuffix) $(IntermediateDirectory)/shared_game.c$(ObjectSuffix) $(IntermediateDirectory)/shared_libfixmath_uint32.c$(ObjectSuffix) $(IntermediateDirectory)/shared_libfixmath_fract32.c$(ObjectSuffix) $(IntermediateDirectory)/shared_util.c$(ObjectSuffix) $(IntermediateDirectory)/shared_vector_drawing.c$(ObjectSuffix) $(IntermediateDirectory)/shared_canvas.c$(ObjectSuffix) $(IntermediateDirectory)/device_device_runtime.c$(ObjectSuffix) \
	



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
	/Applications/codelite.app/Contents/SharedSupport/tools/gcc-arm-custom//arm-none-eabi/bin/objcopy -S -O srec  ./Debug/game-device.elf ./Debug/game-device.s19
	/Applications/codelite.app/Contents/SharedSupport/tools/gcc-arm-custom//arm-none-eabi/bin/objdump -D -S ./Debug/game-device.elf > ./Debug/game-device.dass
	@echo Done

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/shared_libfixmatrix_fixvector4d.c$(ObjectSuffix): shared/libfixmatrix/fixvector4d.c $(IntermediateDirectory)/shared_libfixmatrix_fixvector4d.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/libfixmatrix/fixvector4d.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_libfixmatrix_fixvector4d.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_libfixmatrix_fixvector4d.c$(DependSuffix): shared/libfixmatrix/fixvector4d.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_libfixmatrix_fixvector4d.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_libfixmatrix_fixvector4d.c$(DependSuffix) -MM shared/libfixmatrix/fixvector4d.c

$(IntermediateDirectory)/shared_libfixmatrix_fixvector4d.c$(PreprocessSuffix): shared/libfixmatrix/fixvector4d.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_libfixmatrix_fixvector4d.c$(PreprocessSuffix) shared/libfixmatrix/fixvector4d.c

$(IntermediateDirectory)/shared_libfixmatrix_fixvector3d.c$(ObjectSuffix): shared/libfixmatrix/fixvector3d.c $(IntermediateDirectory)/shared_libfixmatrix_fixvector3d.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/libfixmatrix/fixvector3d.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_libfixmatrix_fixvector3d.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_libfixmatrix_fixvector3d.c$(DependSuffix): shared/libfixmatrix/fixvector3d.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_libfixmatrix_fixvector3d.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_libfixmatrix_fixvector3d.c$(DependSuffix) -MM shared/libfixmatrix/fixvector3d.c

$(IntermediateDirectory)/shared_libfixmatrix_fixvector3d.c$(PreprocessSuffix): shared/libfixmatrix/fixvector3d.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_libfixmatrix_fixvector3d.c$(PreprocessSuffix) shared/libfixmatrix/fixvector3d.c

$(IntermediateDirectory)/shared_libfixmatrix_fixquat.c$(ObjectSuffix): shared/libfixmatrix/fixquat.c $(IntermediateDirectory)/shared_libfixmatrix_fixquat.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/libfixmatrix/fixquat.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_libfixmatrix_fixquat.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_libfixmatrix_fixquat.c$(DependSuffix): shared/libfixmatrix/fixquat.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_libfixmatrix_fixquat.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_libfixmatrix_fixquat.c$(DependSuffix) -MM shared/libfixmatrix/fixquat.c

$(IntermediateDirectory)/shared_libfixmatrix_fixquat.c$(PreprocessSuffix): shared/libfixmatrix/fixquat.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_libfixmatrix_fixquat.c$(PreprocessSuffix) shared/libfixmatrix/fixquat.c

$(IntermediateDirectory)/shared_libdivide_libdivide.c$(ObjectSuffix): shared/libdivide/libdivide.c $(IntermediateDirectory)/shared_libdivide_libdivide.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/libdivide/libdivide.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_libdivide_libdivide.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_libdivide_libdivide.c$(DependSuffix): shared/libdivide/libdivide.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_libdivide_libdivide.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_libdivide_libdivide.c$(DependSuffix) -MM shared/libdivide/libdivide.c

$(IntermediateDirectory)/shared_libdivide_libdivide.c$(PreprocessSuffix): shared/libdivide/libdivide.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_libdivide_libdivide.c$(PreprocessSuffix) shared/libdivide/libdivide.c

$(IntermediateDirectory)/shared_libfixmath_fix16.c$(ObjectSuffix): shared/libfixmath/fix16.c $(IntermediateDirectory)/shared_libfixmath_fix16.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/libfixmath/fix16.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_libfixmath_fix16.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_libfixmath_fix16.c$(DependSuffix): shared/libfixmath/fix16.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_libfixmath_fix16.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_libfixmath_fix16.c$(DependSuffix) -MM shared/libfixmath/fix16.c

$(IntermediateDirectory)/shared_libfixmath_fix16.c$(PreprocessSuffix): shared/libfixmath/fix16.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_libfixmath_fix16.c$(PreprocessSuffix) shared/libfixmath/fix16.c

$(IntermediateDirectory)/shared_libfixmath_fix16_sqrt.c$(ObjectSuffix): shared/libfixmath/fix16_sqrt.c $(IntermediateDirectory)/shared_libfixmath_fix16_sqrt.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/libfixmath/fix16_sqrt.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_libfixmath_fix16_sqrt.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_libfixmath_fix16_sqrt.c$(DependSuffix): shared/libfixmath/fix16_sqrt.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_libfixmath_fix16_sqrt.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_libfixmath_fix16_sqrt.c$(DependSuffix) -MM shared/libfixmath/fix16_sqrt.c

$(IntermediateDirectory)/shared_libfixmath_fix16_sqrt.c$(PreprocessSuffix): shared/libfixmath/fix16_sqrt.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_libfixmath_fix16_sqrt.c$(PreprocessSuffix) shared/libfixmath/fix16_sqrt.c

$(IntermediateDirectory)/shared_libfixmath_fix16_exp.c$(ObjectSuffix): shared/libfixmath/fix16_exp.c $(IntermediateDirectory)/shared_libfixmath_fix16_exp.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/libfixmath/fix16_exp.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_libfixmath_fix16_exp.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_libfixmath_fix16_exp.c$(DependSuffix): shared/libfixmath/fix16_exp.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_libfixmath_fix16_exp.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_libfixmath_fix16_exp.c$(DependSuffix) -MM shared/libfixmath/fix16_exp.c

$(IntermediateDirectory)/shared_libfixmath_fix16_exp.c$(PreprocessSuffix): shared/libfixmath/fix16_exp.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_libfixmath_fix16_exp.c$(PreprocessSuffix) shared/libfixmath/fix16_exp.c

$(IntermediateDirectory)/shared_sprite.c$(ObjectSuffix): shared/sprite.c $(IntermediateDirectory)/shared_sprite.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/sprite.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_sprite.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_sprite.c$(DependSuffix): shared/sprite.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_sprite.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_sprite.c$(DependSuffix) -MM shared/sprite.c

$(IntermediateDirectory)/shared_sprite.c$(PreprocessSuffix): shared/sprite.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_sprite.c$(PreprocessSuffix) shared/sprite.c

$(IntermediateDirectory)/shared_libfixmatrix_fixarray.c$(ObjectSuffix): shared/libfixmatrix/fixarray.c $(IntermediateDirectory)/shared_libfixmatrix_fixarray.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/libfixmatrix/fixarray.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_libfixmatrix_fixarray.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_libfixmatrix_fixarray.c$(DependSuffix): shared/libfixmatrix/fixarray.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_libfixmatrix_fixarray.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_libfixmatrix_fixarray.c$(DependSuffix) -MM shared/libfixmatrix/fixarray.c

$(IntermediateDirectory)/shared_libfixmatrix_fixarray.c$(PreprocessSuffix): shared/libfixmatrix/fixarray.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_libfixmatrix_fixarray.c$(PreprocessSuffix) shared/libfixmatrix/fixarray.c

$(IntermediateDirectory)/shared_libfixmatrix_fixmatrix.c$(ObjectSuffix): shared/libfixmatrix/fixmatrix.c $(IntermediateDirectory)/shared_libfixmatrix_fixmatrix.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/libfixmatrix/fixmatrix.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_libfixmatrix_fixmatrix.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_libfixmatrix_fixmatrix.c$(DependSuffix): shared/libfixmatrix/fixmatrix.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_libfixmatrix_fixmatrix.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_libfixmatrix_fixmatrix.c$(DependSuffix) -MM shared/libfixmatrix/fixmatrix.c

$(IntermediateDirectory)/shared_libfixmatrix_fixmatrix.c$(PreprocessSuffix): shared/libfixmatrix/fixmatrix.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_libfixmatrix_fixmatrix.c$(PreprocessSuffix) shared/libfixmatrix/fixmatrix.c

$(IntermediateDirectory)/device_main.c$(ObjectSuffix): device/main.c $(IntermediateDirectory)/device_main.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/device/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_main.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/device_main.c$(DependSuffix): device/main.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/device_main.c$(ObjectSuffix) -MF$(IntermediateDirectory)/device_main.c$(DependSuffix) -MM device/main.c

$(IntermediateDirectory)/device_main.c$(PreprocessSuffix): device/main.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/device_main.c$(PreprocessSuffix) device/main.c

$(IntermediateDirectory)/shared_libfixmatrix_fixvector2d.c$(ObjectSuffix): shared/libfixmatrix/fixvector2d.c $(IntermediateDirectory)/shared_libfixmatrix_fixvector2d.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/libfixmatrix/fixvector2d.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_libfixmatrix_fixvector2d.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_libfixmatrix_fixvector2d.c$(DependSuffix): shared/libfixmatrix/fixvector2d.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_libfixmatrix_fixvector2d.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_libfixmatrix_fixvector2d.c$(DependSuffix) -MM shared/libfixmatrix/fixvector2d.c

$(IntermediateDirectory)/shared_libfixmatrix_fixvector2d.c$(PreprocessSuffix): shared/libfixmatrix/fixvector2d.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_libfixmatrix_fixvector2d.c$(PreprocessSuffix) shared/libfixmatrix/fixvector2d.c

$(IntermediateDirectory)/shared_libfixmath_fix16_trig.c$(ObjectSuffix): shared/libfixmath/fix16_trig.c $(IntermediateDirectory)/shared_libfixmath_fix16_trig.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/libfixmath/fix16_trig.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_libfixmath_fix16_trig.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_libfixmath_fix16_trig.c$(DependSuffix): shared/libfixmath/fix16_trig.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_libfixmath_fix16_trig.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_libfixmath_fix16_trig.c$(DependSuffix) -MM shared/libfixmath/fix16_trig.c

$(IntermediateDirectory)/shared_libfixmath_fix16_trig.c$(PreprocessSuffix): shared/libfixmath/fix16_trig.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_libfixmath_fix16_trig.c$(PreprocessSuffix) shared/libfixmath/fix16_trig.c

$(IntermediateDirectory)/shared_game.c$(ObjectSuffix): shared/game.c $(IntermediateDirectory)/shared_game.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/game.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_game.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_game.c$(DependSuffix): shared/game.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_game.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_game.c$(DependSuffix) -MM shared/game.c

$(IntermediateDirectory)/shared_game.c$(PreprocessSuffix): shared/game.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_game.c$(PreprocessSuffix) shared/game.c

$(IntermediateDirectory)/shared_libfixmath_uint32.c$(ObjectSuffix): shared/libfixmath/uint32.c $(IntermediateDirectory)/shared_libfixmath_uint32.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/libfixmath/uint32.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_libfixmath_uint32.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_libfixmath_uint32.c$(DependSuffix): shared/libfixmath/uint32.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_libfixmath_uint32.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_libfixmath_uint32.c$(DependSuffix) -MM shared/libfixmath/uint32.c

$(IntermediateDirectory)/shared_libfixmath_uint32.c$(PreprocessSuffix): shared/libfixmath/uint32.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_libfixmath_uint32.c$(PreprocessSuffix) shared/libfixmath/uint32.c

$(IntermediateDirectory)/shared_libfixmath_fract32.c$(ObjectSuffix): shared/libfixmath/fract32.c $(IntermediateDirectory)/shared_libfixmath_fract32.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/libfixmath/fract32.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_libfixmath_fract32.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_libfixmath_fract32.c$(DependSuffix): shared/libfixmath/fract32.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_libfixmath_fract32.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_libfixmath_fract32.c$(DependSuffix) -MM shared/libfixmath/fract32.c

$(IntermediateDirectory)/shared_libfixmath_fract32.c$(PreprocessSuffix): shared/libfixmath/fract32.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_libfixmath_fract32.c$(PreprocessSuffix) shared/libfixmath/fract32.c

$(IntermediateDirectory)/shared_util.c$(ObjectSuffix): shared/util.c $(IntermediateDirectory)/shared_util.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/util.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_util.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_util.c$(DependSuffix): shared/util.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_util.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_util.c$(DependSuffix) -MM shared/util.c

$(IntermediateDirectory)/shared_util.c$(PreprocessSuffix): shared/util.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_util.c$(PreprocessSuffix) shared/util.c

$(IntermediateDirectory)/shared_vector_drawing.c$(ObjectSuffix): shared/vector_drawing.c $(IntermediateDirectory)/shared_vector_drawing.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/vector_drawing.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_vector_drawing.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_vector_drawing.c$(DependSuffix): shared/vector_drawing.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_vector_drawing.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_vector_drawing.c$(DependSuffix) -MM shared/vector_drawing.c

$(IntermediateDirectory)/shared_vector_drawing.c$(PreprocessSuffix): shared/vector_drawing.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_vector_drawing.c$(PreprocessSuffix) shared/vector_drawing.c

$(IntermediateDirectory)/shared_canvas.c$(ObjectSuffix): shared/canvas.c $(IntermediateDirectory)/shared_canvas.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/canvas.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_canvas.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_canvas.c$(DependSuffix): shared/canvas.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_canvas.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_canvas.c$(DependSuffix) -MM shared/canvas.c

$(IntermediateDirectory)/shared_canvas.c$(PreprocessSuffix): shared/canvas.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_canvas.c$(PreprocessSuffix) shared/canvas.c

$(IntermediateDirectory)/device_device_runtime.c$(ObjectSuffix): device/device_runtime.c $(IntermediateDirectory)/device_device_runtime.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/device/device_runtime.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_device_runtime.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/device_device_runtime.c$(DependSuffix): device/device_runtime.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/device_device_runtime.c$(ObjectSuffix) -MF$(IntermediateDirectory)/device_device_runtime.c$(DependSuffix) -MM device/device_runtime.c

$(IntermediateDirectory)/device_device_runtime.c$(PreprocessSuffix): device/device_runtime.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/device_device_runtime.c$(PreprocessSuffix) device/device_runtime.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


