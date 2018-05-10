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
Date                   :=09/05/2018
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
CFLAGS   :=  -g -O1 -mthumb -Wall -march=armv6-m -Wa,-adhln=test.s -msoft-float  $(Preprocessors)
ASFLAGS  := 
AS       := $(CodeLiteDir)/tools/gcc-arm-custom/bin/arm-none-eabi-as


##
## User defined environment variables
##
CodeLiteDir:=/Applications/codelite.app/Contents/SharedSupport/
CustomGccArmDir:=$(CodeLiteDir)tools/gcc-arm/
GccArmDir:=$(CodeliteDir)/tools/gcc-arm
ARM_V6LIB:=$(GccArmDir)/arm-none-eabi/lib/thumb/v6-m
ARM_GCC_V6LIB:=$(GccArmDir)/lib/gcc/arm-none-eabi/7.2.1/thumb/v6-m
ARM_M4FPLIB:=$(GccArmDir)/arm-none-eabi/lib/thumb/v7e-m/fpv4-sp/hard
ARM_GCC_M4FPLIB:=$(GccArmDir)/lib/gcc/arm-none-eabi/7.2.1/thumb/v7e-m
Objects0=$(IntermediateDirectory)/shared_math_s_sqrt.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_export.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_rredf.c$(ObjectSuffix) $(IntermediateDirectory)/device_main.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_poly.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_e_rem_pio2.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_math_errf.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_e_exp2f_data.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_e_logf.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_funder.c$(ObjectSuffix) \
	$(IntermediateDirectory)/shared_math_s_sinf.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_dunder.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_e_powf_log2_data.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_e_expf.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_e_powf.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_e_exp2f.c$(ObjectSuffix) $(IntermediateDirectory)/shared_matrix-lib_vec3.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_e_logf_data.c$(ObjectSuffix) $(IntermediateDirectory)/shared_matrix-lib_quat.c$(ObjectSuffix) $(IntermediateDirectory)/shared_matrix-lib_mat4.c$(ObjectSuffix) \
	$(IntermediateDirectory)/shared_matrix-lib_mat3.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_s_tanf.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_s_cosf.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_e_log2f.c$(ObjectSuffix) $(IntermediateDirectory)/device_device_runtime.c$(ObjectSuffix) $(IntermediateDirectory)/shared_vector_drawing.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_e_log2f_data.c$(ObjectSuffix) $(IntermediateDirectory)/shared_game.c$(ObjectSuffix) $(IntermediateDirectory)/shared_sprite.c$(ObjectSuffix) $(IntermediateDirectory)/shared_math_ieee_status.c$(ObjectSuffix) \
	$(IntermediateDirectory)/shared_canvas.c$(ObjectSuffix) $(IntermediateDirectory)/shared_util.c$(ObjectSuffix) 



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
	/Applications/codelite.app/Contents/SharedSupport/tools/gcc-arm//arm-none-eabi/bin/objcopy -S -O srec  ./Debug/game-device.elf ./Debug/game-device.s19
	/Applications/codelite.app/Contents/SharedSupport/tools/gcc-arm//arm-none-eabi/bin/objdump -D -S ./Debug/game-device.elf > ./Debug/game-device.dass
	@echo Done

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/shared_math_s_sqrt.c$(ObjectSuffix): shared/math/s_sqrt.c $(IntermediateDirectory)/shared_math_s_sqrt.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/s_sqrt.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_s_sqrt.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_s_sqrt.c$(DependSuffix): shared/math/s_sqrt.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_s_sqrt.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_s_sqrt.c$(DependSuffix) -MM shared/math/s_sqrt.c

$(IntermediateDirectory)/shared_math_s_sqrt.c$(PreprocessSuffix): shared/math/s_sqrt.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_s_sqrt.c$(PreprocessSuffix) shared/math/s_sqrt.c

$(IntermediateDirectory)/shared_math_export.c$(ObjectSuffix): shared/math/export.c $(IntermediateDirectory)/shared_math_export.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/export.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_export.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_export.c$(DependSuffix): shared/math/export.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_export.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_export.c$(DependSuffix) -MM shared/math/export.c

$(IntermediateDirectory)/shared_math_export.c$(PreprocessSuffix): shared/math/export.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_export.c$(PreprocessSuffix) shared/math/export.c

$(IntermediateDirectory)/shared_math_rredf.c$(ObjectSuffix): shared/math/rredf.c $(IntermediateDirectory)/shared_math_rredf.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/rredf.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_rredf.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_rredf.c$(DependSuffix): shared/math/rredf.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_rredf.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_rredf.c$(DependSuffix) -MM shared/math/rredf.c

$(IntermediateDirectory)/shared_math_rredf.c$(PreprocessSuffix): shared/math/rredf.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_rredf.c$(PreprocessSuffix) shared/math/rredf.c

$(IntermediateDirectory)/device_main.c$(ObjectSuffix): device/main.c $(IntermediateDirectory)/device_main.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/device/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_main.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/device_main.c$(DependSuffix): device/main.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/device_main.c$(ObjectSuffix) -MF$(IntermediateDirectory)/device_main.c$(DependSuffix) -MM device/main.c

$(IntermediateDirectory)/device_main.c$(PreprocessSuffix): device/main.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/device_main.c$(PreprocessSuffix) device/main.c

$(IntermediateDirectory)/shared_math_poly.c$(ObjectSuffix): shared/math/poly.c $(IntermediateDirectory)/shared_math_poly.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/poly.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_poly.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_poly.c$(DependSuffix): shared/math/poly.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_poly.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_poly.c$(DependSuffix) -MM shared/math/poly.c

$(IntermediateDirectory)/shared_math_poly.c$(PreprocessSuffix): shared/math/poly.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_poly.c$(PreprocessSuffix) shared/math/poly.c

$(IntermediateDirectory)/shared_math_e_rem_pio2.c$(ObjectSuffix): shared/math/e_rem_pio2.c $(IntermediateDirectory)/shared_math_e_rem_pio2.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/e_rem_pio2.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_e_rem_pio2.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_e_rem_pio2.c$(DependSuffix): shared/math/e_rem_pio2.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_e_rem_pio2.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_e_rem_pio2.c$(DependSuffix) -MM shared/math/e_rem_pio2.c

$(IntermediateDirectory)/shared_math_e_rem_pio2.c$(PreprocessSuffix): shared/math/e_rem_pio2.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_e_rem_pio2.c$(PreprocessSuffix) shared/math/e_rem_pio2.c

$(IntermediateDirectory)/shared_math_math_errf.c$(ObjectSuffix): shared/math/math_errf.c $(IntermediateDirectory)/shared_math_math_errf.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/math_errf.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_math_errf.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_math_errf.c$(DependSuffix): shared/math/math_errf.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_math_errf.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_math_errf.c$(DependSuffix) -MM shared/math/math_errf.c

$(IntermediateDirectory)/shared_math_math_errf.c$(PreprocessSuffix): shared/math/math_errf.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_math_errf.c$(PreprocessSuffix) shared/math/math_errf.c

$(IntermediateDirectory)/shared_math_e_exp2f_data.c$(ObjectSuffix): shared/math/e_exp2f_data.c $(IntermediateDirectory)/shared_math_e_exp2f_data.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/e_exp2f_data.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_e_exp2f_data.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_e_exp2f_data.c$(DependSuffix): shared/math/e_exp2f_data.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_e_exp2f_data.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_e_exp2f_data.c$(DependSuffix) -MM shared/math/e_exp2f_data.c

$(IntermediateDirectory)/shared_math_e_exp2f_data.c$(PreprocessSuffix): shared/math/e_exp2f_data.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_e_exp2f_data.c$(PreprocessSuffix) shared/math/e_exp2f_data.c

$(IntermediateDirectory)/shared_math_e_logf.c$(ObjectSuffix): shared/math/e_logf.c $(IntermediateDirectory)/shared_math_e_logf.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/e_logf.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_e_logf.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_e_logf.c$(DependSuffix): shared/math/e_logf.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_e_logf.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_e_logf.c$(DependSuffix) -MM shared/math/e_logf.c

$(IntermediateDirectory)/shared_math_e_logf.c$(PreprocessSuffix): shared/math/e_logf.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_e_logf.c$(PreprocessSuffix) shared/math/e_logf.c

$(IntermediateDirectory)/shared_math_funder.c$(ObjectSuffix): shared/math/funder.c $(IntermediateDirectory)/shared_math_funder.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/funder.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_funder.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_funder.c$(DependSuffix): shared/math/funder.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_funder.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_funder.c$(DependSuffix) -MM shared/math/funder.c

$(IntermediateDirectory)/shared_math_funder.c$(PreprocessSuffix): shared/math/funder.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_funder.c$(PreprocessSuffix) shared/math/funder.c

$(IntermediateDirectory)/shared_math_s_sinf.c$(ObjectSuffix): shared/math/s_sinf.c $(IntermediateDirectory)/shared_math_s_sinf.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/s_sinf.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_s_sinf.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_s_sinf.c$(DependSuffix): shared/math/s_sinf.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_s_sinf.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_s_sinf.c$(DependSuffix) -MM shared/math/s_sinf.c

$(IntermediateDirectory)/shared_math_s_sinf.c$(PreprocessSuffix): shared/math/s_sinf.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_s_sinf.c$(PreprocessSuffix) shared/math/s_sinf.c

$(IntermediateDirectory)/shared_math_dunder.c$(ObjectSuffix): shared/math/dunder.c $(IntermediateDirectory)/shared_math_dunder.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/dunder.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_dunder.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_dunder.c$(DependSuffix): shared/math/dunder.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_dunder.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_dunder.c$(DependSuffix) -MM shared/math/dunder.c

$(IntermediateDirectory)/shared_math_dunder.c$(PreprocessSuffix): shared/math/dunder.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_dunder.c$(PreprocessSuffix) shared/math/dunder.c

$(IntermediateDirectory)/shared_math_e_powf_log2_data.c$(ObjectSuffix): shared/math/e_powf_log2_data.c $(IntermediateDirectory)/shared_math_e_powf_log2_data.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/e_powf_log2_data.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_e_powf_log2_data.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_e_powf_log2_data.c$(DependSuffix): shared/math/e_powf_log2_data.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_e_powf_log2_data.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_e_powf_log2_data.c$(DependSuffix) -MM shared/math/e_powf_log2_data.c

$(IntermediateDirectory)/shared_math_e_powf_log2_data.c$(PreprocessSuffix): shared/math/e_powf_log2_data.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_e_powf_log2_data.c$(PreprocessSuffix) shared/math/e_powf_log2_data.c

$(IntermediateDirectory)/shared_math_e_expf.c$(ObjectSuffix): shared/math/e_expf.c $(IntermediateDirectory)/shared_math_e_expf.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/e_expf.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_e_expf.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_e_expf.c$(DependSuffix): shared/math/e_expf.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_e_expf.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_e_expf.c$(DependSuffix) -MM shared/math/e_expf.c

$(IntermediateDirectory)/shared_math_e_expf.c$(PreprocessSuffix): shared/math/e_expf.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_e_expf.c$(PreprocessSuffix) shared/math/e_expf.c

$(IntermediateDirectory)/shared_math_e_powf.c$(ObjectSuffix): shared/math/e_powf.c $(IntermediateDirectory)/shared_math_e_powf.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/e_powf.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_e_powf.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_e_powf.c$(DependSuffix): shared/math/e_powf.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_e_powf.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_e_powf.c$(DependSuffix) -MM shared/math/e_powf.c

$(IntermediateDirectory)/shared_math_e_powf.c$(PreprocessSuffix): shared/math/e_powf.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_e_powf.c$(PreprocessSuffix) shared/math/e_powf.c

$(IntermediateDirectory)/shared_math_e_exp2f.c$(ObjectSuffix): shared/math/e_exp2f.c $(IntermediateDirectory)/shared_math_e_exp2f.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/e_exp2f.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_e_exp2f.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_e_exp2f.c$(DependSuffix): shared/math/e_exp2f.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_e_exp2f.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_e_exp2f.c$(DependSuffix) -MM shared/math/e_exp2f.c

$(IntermediateDirectory)/shared_math_e_exp2f.c$(PreprocessSuffix): shared/math/e_exp2f.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_e_exp2f.c$(PreprocessSuffix) shared/math/e_exp2f.c

$(IntermediateDirectory)/shared_matrix-lib_vec3.c$(ObjectSuffix): shared/matrix-lib/vec3.c $(IntermediateDirectory)/shared_matrix-lib_vec3.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/matrix-lib/vec3.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_matrix-lib_vec3.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_matrix-lib_vec3.c$(DependSuffix): shared/matrix-lib/vec3.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_matrix-lib_vec3.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_matrix-lib_vec3.c$(DependSuffix) -MM shared/matrix-lib/vec3.c

$(IntermediateDirectory)/shared_matrix-lib_vec3.c$(PreprocessSuffix): shared/matrix-lib/vec3.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_matrix-lib_vec3.c$(PreprocessSuffix) shared/matrix-lib/vec3.c

$(IntermediateDirectory)/shared_math_e_logf_data.c$(ObjectSuffix): shared/math/e_logf_data.c $(IntermediateDirectory)/shared_math_e_logf_data.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/e_logf_data.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_e_logf_data.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_e_logf_data.c$(DependSuffix): shared/math/e_logf_data.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_e_logf_data.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_e_logf_data.c$(DependSuffix) -MM shared/math/e_logf_data.c

$(IntermediateDirectory)/shared_math_e_logf_data.c$(PreprocessSuffix): shared/math/e_logf_data.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_e_logf_data.c$(PreprocessSuffix) shared/math/e_logf_data.c

$(IntermediateDirectory)/shared_matrix-lib_quat.c$(ObjectSuffix): shared/matrix-lib/quat.c $(IntermediateDirectory)/shared_matrix-lib_quat.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/matrix-lib/quat.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_matrix-lib_quat.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_matrix-lib_quat.c$(DependSuffix): shared/matrix-lib/quat.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_matrix-lib_quat.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_matrix-lib_quat.c$(DependSuffix) -MM shared/matrix-lib/quat.c

$(IntermediateDirectory)/shared_matrix-lib_quat.c$(PreprocessSuffix): shared/matrix-lib/quat.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_matrix-lib_quat.c$(PreprocessSuffix) shared/matrix-lib/quat.c

$(IntermediateDirectory)/shared_matrix-lib_mat4.c$(ObjectSuffix): shared/matrix-lib/mat4.c $(IntermediateDirectory)/shared_matrix-lib_mat4.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/matrix-lib/mat4.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_matrix-lib_mat4.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_matrix-lib_mat4.c$(DependSuffix): shared/matrix-lib/mat4.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_matrix-lib_mat4.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_matrix-lib_mat4.c$(DependSuffix) -MM shared/matrix-lib/mat4.c

$(IntermediateDirectory)/shared_matrix-lib_mat4.c$(PreprocessSuffix): shared/matrix-lib/mat4.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_matrix-lib_mat4.c$(PreprocessSuffix) shared/matrix-lib/mat4.c

$(IntermediateDirectory)/shared_matrix-lib_mat3.c$(ObjectSuffix): shared/matrix-lib/mat3.c $(IntermediateDirectory)/shared_matrix-lib_mat3.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/matrix-lib/mat3.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_matrix-lib_mat3.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_matrix-lib_mat3.c$(DependSuffix): shared/matrix-lib/mat3.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_matrix-lib_mat3.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_matrix-lib_mat3.c$(DependSuffix) -MM shared/matrix-lib/mat3.c

$(IntermediateDirectory)/shared_matrix-lib_mat3.c$(PreprocessSuffix): shared/matrix-lib/mat3.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_matrix-lib_mat3.c$(PreprocessSuffix) shared/matrix-lib/mat3.c

$(IntermediateDirectory)/shared_math_s_tanf.c$(ObjectSuffix): shared/math/s_tanf.c $(IntermediateDirectory)/shared_math_s_tanf.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/s_tanf.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_s_tanf.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_s_tanf.c$(DependSuffix): shared/math/s_tanf.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_s_tanf.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_s_tanf.c$(DependSuffix) -MM shared/math/s_tanf.c

$(IntermediateDirectory)/shared_math_s_tanf.c$(PreprocessSuffix): shared/math/s_tanf.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_s_tanf.c$(PreprocessSuffix) shared/math/s_tanf.c

$(IntermediateDirectory)/shared_math_s_cosf.c$(ObjectSuffix): shared/math/s_cosf.c $(IntermediateDirectory)/shared_math_s_cosf.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/s_cosf.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_s_cosf.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_s_cosf.c$(DependSuffix): shared/math/s_cosf.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_s_cosf.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_s_cosf.c$(DependSuffix) -MM shared/math/s_cosf.c

$(IntermediateDirectory)/shared_math_s_cosf.c$(PreprocessSuffix): shared/math/s_cosf.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_s_cosf.c$(PreprocessSuffix) shared/math/s_cosf.c

$(IntermediateDirectory)/shared_math_e_log2f.c$(ObjectSuffix): shared/math/e_log2f.c $(IntermediateDirectory)/shared_math_e_log2f.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/e_log2f.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_e_log2f.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_e_log2f.c$(DependSuffix): shared/math/e_log2f.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_e_log2f.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_e_log2f.c$(DependSuffix) -MM shared/math/e_log2f.c

$(IntermediateDirectory)/shared_math_e_log2f.c$(PreprocessSuffix): shared/math/e_log2f.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_e_log2f.c$(PreprocessSuffix) shared/math/e_log2f.c

$(IntermediateDirectory)/device_device_runtime.c$(ObjectSuffix): device/device_runtime.c $(IntermediateDirectory)/device_device_runtime.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/device/device_runtime.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/device_device_runtime.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/device_device_runtime.c$(DependSuffix): device/device_runtime.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/device_device_runtime.c$(ObjectSuffix) -MF$(IntermediateDirectory)/device_device_runtime.c$(DependSuffix) -MM device/device_runtime.c

$(IntermediateDirectory)/device_device_runtime.c$(PreprocessSuffix): device/device_runtime.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/device_device_runtime.c$(PreprocessSuffix) device/device_runtime.c

$(IntermediateDirectory)/shared_vector_drawing.c$(ObjectSuffix): shared/vector_drawing.c $(IntermediateDirectory)/shared_vector_drawing.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/vector_drawing.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_vector_drawing.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_vector_drawing.c$(DependSuffix): shared/vector_drawing.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_vector_drawing.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_vector_drawing.c$(DependSuffix) -MM shared/vector_drawing.c

$(IntermediateDirectory)/shared_vector_drawing.c$(PreprocessSuffix): shared/vector_drawing.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_vector_drawing.c$(PreprocessSuffix) shared/vector_drawing.c

$(IntermediateDirectory)/shared_math_e_log2f_data.c$(ObjectSuffix): shared/math/e_log2f_data.c $(IntermediateDirectory)/shared_math_e_log2f_data.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/e_log2f_data.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_e_log2f_data.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_e_log2f_data.c$(DependSuffix): shared/math/e_log2f_data.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_e_log2f_data.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_e_log2f_data.c$(DependSuffix) -MM shared/math/e_log2f_data.c

$(IntermediateDirectory)/shared_math_e_log2f_data.c$(PreprocessSuffix): shared/math/e_log2f_data.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_e_log2f_data.c$(PreprocessSuffix) shared/math/e_log2f_data.c

$(IntermediateDirectory)/shared_game.c$(ObjectSuffix): shared/game.c $(IntermediateDirectory)/shared_game.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/game.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_game.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_game.c$(DependSuffix): shared/game.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_game.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_game.c$(DependSuffix) -MM shared/game.c

$(IntermediateDirectory)/shared_game.c$(PreprocessSuffix): shared/game.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_game.c$(PreprocessSuffix) shared/game.c

$(IntermediateDirectory)/shared_sprite.c$(ObjectSuffix): shared/sprite.c $(IntermediateDirectory)/shared_sprite.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/sprite.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_sprite.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_sprite.c$(DependSuffix): shared/sprite.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_sprite.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_sprite.c$(DependSuffix) -MM shared/sprite.c

$(IntermediateDirectory)/shared_sprite.c$(PreprocessSuffix): shared/sprite.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_sprite.c$(PreprocessSuffix) shared/sprite.c

$(IntermediateDirectory)/shared_math_ieee_status.c$(ObjectSuffix): shared/math/ieee_status.c $(IntermediateDirectory)/shared_math_ieee_status.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/math/ieee_status.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_math_ieee_status.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_math_ieee_status.c$(DependSuffix): shared/math/ieee_status.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_math_ieee_status.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_math_ieee_status.c$(DependSuffix) -MM shared/math/ieee_status.c

$(IntermediateDirectory)/shared_math_ieee_status.c$(PreprocessSuffix): shared/math/ieee_status.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_math_ieee_status.c$(PreprocessSuffix) shared/math/ieee_status.c

$(IntermediateDirectory)/shared_canvas.c$(ObjectSuffix): shared/canvas.c $(IntermediateDirectory)/shared_canvas.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/canvas.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_canvas.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_canvas.c$(DependSuffix): shared/canvas.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_canvas.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_canvas.c$(DependSuffix) -MM shared/canvas.c

$(IntermediateDirectory)/shared_canvas.c$(PreprocessSuffix): shared/canvas.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_canvas.c$(PreprocessSuffix) shared/canvas.c

$(IntermediateDirectory)/shared_util.c$(ObjectSuffix): shared/util.c $(IntermediateDirectory)/shared_util.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/Users/legge/Development/moppen-game/shared/util.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/shared_util.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/shared_util.c$(DependSuffix): shared/util.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/shared_util.c$(ObjectSuffix) -MF$(IntermediateDirectory)/shared_util.c$(DependSuffix) -MM shared/util.c

$(IntermediateDirectory)/shared_util.c$(PreprocessSuffix): shared/util.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/shared_util.c$(PreprocessSuffix) shared/util.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


