!STARTOFREGISTRYGENERATEDFILE 'Waves2_Types.f90'
!
! WARNING This file is generated automatically by the FAST registry.
! Do not edit.  Your changes to this file will be lost.
!
! FAST Registry
!*********************************************************************************************************************************
! Waves2_Types
!.................................................................................................................................
! This file is part of Waves2.
!
! Copyright (C) 2012-2016 National Renewable Energy Laboratory
!
! Licensed under the Apache License, Version 2.0 (the "License");
! you may not use this file except in compliance with the License.
! You may obtain a copy of the License at
!
!     http://www.apache.org/licenses/LICENSE-2.0
!
! Unless required by applicable law or agreed to in writing, software
! distributed under the License is distributed on an "AS IS" BASIS,
! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
! See the License for the specific language governing permissions and
! limitations under the License.
!
!
! W A R N I N G : This file was automatically generated from the FAST registry.  Changes made to this file may be lost.
!
!*********************************************************************************************************************************
!> This module contains the user-defined types needed in Waves2. It also contains copy, destroy, pack, and
!! unpack routines associated with each defined data type. This code is automatically generated by the FAST Registry.
MODULE Waves2_Types
!---------------------------------------------------------------------------------------------------------------------------------
USE NWTC_Library
IMPLICIT NONE
! =========  Waves2_InitInputType  =======
  TYPE, PUBLIC :: Waves2_InitInputType
    REAL(ReKi)  :: Gravity = 0.0_ReKi      !< Gravitational acceleration [(m/s^2)]
    REAL(ReKi)  :: WtrDens = 0.0_ReKi      !< Water density [(kg/m^3)]
    REAL(ReKi)  :: WtrDpth = 0.0_ReKi      !< Water depth [(meters)]
    INTEGER(IntKi)  :: NStepWave = 0_IntKi      !< Total number of frequency components = total number of time steps in the incident wave [-]
    INTEGER(IntKi)  :: NStepWave2 = 0_IntKi      !< NStepWave / 2 [-]
    REAL(SiKi)  :: WaveDOmega = 0.0_R4Ki      !< Frequency step for incident wave calculations [(rad/s)]
    INTEGER(IntKi)  :: WaveStMod = 0_IntKi      !< Model for stretching incident wave kinematics to instantaneous free surface {0: none=no stretching, 1: vertical stretching, 2: extrapolation stretching, 3: Wheeler stretching} [-]
    LOGICAL  :: WaveMultiDir = .false.      !< Indicates the waves are multidirectional -- set by HydroDyn_Input [-]
    REAL(SiKi) , DIMENSION(:), POINTER  :: WaveDirArr => NULL()      !< Wave direction array.  Each frequency has a unique direction of WaveNDir > 1 [(degrees)]
    REAL(SiKi) , DIMENSION(:,:), POINTER  :: WaveElevC0 => NULL()      !< Discrete Fourier transform of the instantaneous elevation of incident waves at the platform reference point.  First column is real part, second column is imaginary part [(meters)]
    INTEGER(IntKi) , DIMENSION(1:3)  :: nGrid = 0_IntKi      !< Grid dimensions [-]
    INTEGER(IntKi)  :: NWaveElevGrid = 0_IntKi      !< Number of grid points where the incident wave elevations can be output [-]
    INTEGER(IntKi)  :: NWaveKinGrid = 0_IntKi      !< Number of grid points where the incident wave kinematics will be computed [-]
    REAL(SiKi) , DIMENSION(:), ALLOCATABLE  :: WaveKinGridxi      !< xi-coordinates for grid points where the incident wave kinematics will be computed; these are relative to the mean sea level [(meters)]
    REAL(SiKi) , DIMENSION(:), ALLOCATABLE  :: WaveKinGridyi      !< yi-coordinates for grid points where the incident wave kinematics will be computed; these are relative to the mean sea level [(meters)]
    REAL(SiKi) , DIMENSION(:), ALLOCATABLE  :: WaveKinGridzi      !< zi-coordinates for grid points where the incident wave kinematics will be computed; these are relative to the mean sea level [(meters)]
    LOGICAL  :: WvDiffQTFF = .false.      !< Full difference QTF second order forces flag [(-)]
    LOGICAL  :: WvSumQTFF = .false.      !< Full sum QTF second order forces flag [(-)]
    REAL(SiKi)  :: WvLowCOffD = 0.0_R4Ki      !< Minimum frequency used in the difference methods [Ignored if all difference methods = 0] [(rad/s)]
    REAL(SiKi)  :: WvHiCOffD = 0.0_R4Ki      !< Maximum frequency used in the difference methods [Ignored if all difference methods = 0] [(rad/s)]
    REAL(SiKi)  :: WvLowCOffS = 0.0_R4Ki      !< Minimum frequency used in the sum-QTF method     [Ignored if SumQTF = 0] [(rad/s)]
    REAL(SiKi)  :: WvHiCOffS = 0.0_R4Ki      !< Maximum frequency used in the sum-QTF method     [Ignored if SumQTF = 0] [(rad/s)]
  END TYPE Waves2_InitInputType
! =======================
! =========  Waves2_InitOutputType  =======
  TYPE, PUBLIC :: Waves2_InitOutputType
    REAL(SiKi) , DIMENSION(:,:,:,:,:), ALLOCATABLE  :: WaveAcc2D      !< Instantaneous 2nd-order difference frequency correction for the acceleration     of incident waves in the xi- (1), yi- (2), and zi- (3) directions, respectively, at each of the NWaveKinGrid points where the incident wave kinematics will be computed [(m/s^2)]
    REAL(SiKi) , DIMENSION(:,:,:,:), ALLOCATABLE  :: WaveDynP2D      !< Instantaneous 2nd-order difference frequency correction for the dynamic pressure of incident waves                                                              , at each of the NWaveKinGrid points where the incident wave kinematics will be computed [(N/m^2)]
    REAL(SiKi) , DIMENSION(:,:,:,:,:), ALLOCATABLE  :: WaveAcc2S      !< Instantaneous 2nd-order sum        frequency correction for the acceleration     of incident waves in the xi- (1), yi- (2), and zi- (3) directions, respectively, at each of the NWaveKinGrid points where the incident wave kinematics will be computed [(m/s^2)]
    REAL(SiKi) , DIMENSION(:,:,:,:), ALLOCATABLE  :: WaveDynP2S      !< Instantaneous 2nd-order sum        frequency correction for the dynamic pressure of incident waves                                                              , at each of the NWaveKinGrid points where the incident wave kinematics will be computed [(N/m^2)]
    REAL(SiKi) , DIMENSION(:,:,:,:,:), ALLOCATABLE  :: WaveVel2D      !< Instantaneous 2nd-order difference frequency correction for the velocity         of incident waves in the xi- (1), yi- (2), and zi- (3) directions, respectively, at each of the NWaveKinGrid points where the incident wave kinematics will be computed (The values include both the velocity of incident waves and the velocity of current.) [(m/s)]
    REAL(SiKi) , DIMENSION(:,:,:,:,:), ALLOCATABLE  :: WaveVel2S      !< Instantaneous 2nd-order sum        frequency correction for the velocity         of incident waves in the xi- (1), yi- (2), and zi- (3) directions, respectively, at each of the NWaveKinGrid points where the incident wave kinematics will be computed (The values include both the velocity of incident waves and the velocity of current.) [(m/s)]
    REAL(SiKi) , DIMENSION(:,:,:), POINTER  :: WaveElev2 => NULL()      !< Instantaneous elevation time-series of incident waves at each of the NWaveElevGrid points where the incident wave elevations can be output [(meters)]
  END TYPE Waves2_InitOutputType
! =======================
! =========  Waves2_ParameterType  =======
  TYPE, PUBLIC :: Waves2_ParameterType
    LOGICAL  :: WvDiffQTFF = .false.      !< Full difference QTF second order forces flag [(-)]
    LOGICAL  :: WvSumQTFF = .false.      !< Full sum QTF second order forces flag [(-)]
  END TYPE Waves2_ParameterType
! =======================
CONTAINS

subroutine Waves2_CopyInitInput(SrcInitInputData, DstInitInputData, CtrlCode, ErrStat, ErrMsg)
   type(Waves2_InitInputType), intent(in) :: SrcInitInputData
   type(Waves2_InitInputType), intent(inout) :: DstInitInputData
   integer(IntKi),  intent(in   ) :: CtrlCode
   integer(IntKi),  intent(  out) :: ErrStat
   character(*),    intent(  out) :: ErrMsg
   integer(IntKi)                 :: LB(2), UB(2)
   integer(IntKi)                 :: ErrStat2
   character(*), parameter        :: RoutineName = 'Waves2_CopyInitInput'
   ErrStat = ErrID_None
   ErrMsg  = ''
   DstInitInputData%Gravity = SrcInitInputData%Gravity
   DstInitInputData%WtrDens = SrcInitInputData%WtrDens
   DstInitInputData%WtrDpth = SrcInitInputData%WtrDpth
   DstInitInputData%NStepWave = SrcInitInputData%NStepWave
   DstInitInputData%NStepWave2 = SrcInitInputData%NStepWave2
   DstInitInputData%WaveDOmega = SrcInitInputData%WaveDOmega
   DstInitInputData%WaveStMod = SrcInitInputData%WaveStMod
   DstInitInputData%WaveMultiDir = SrcInitInputData%WaveMultiDir
   DstInitInputData%WaveDirArr => SrcInitInputData%WaveDirArr
   DstInitInputData%WaveElevC0 => SrcInitInputData%WaveElevC0
   DstInitInputData%nGrid = SrcInitInputData%nGrid
   DstInitInputData%NWaveElevGrid = SrcInitInputData%NWaveElevGrid
   DstInitInputData%NWaveKinGrid = SrcInitInputData%NWaveKinGrid
   if (allocated(SrcInitInputData%WaveKinGridxi)) then
      LB(1:1) = lbound(SrcInitInputData%WaveKinGridxi)
      UB(1:1) = ubound(SrcInitInputData%WaveKinGridxi)
      if (.not. allocated(DstInitInputData%WaveKinGridxi)) then
         allocate(DstInitInputData%WaveKinGridxi(LB(1):UB(1)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstInitInputData%WaveKinGridxi.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstInitInputData%WaveKinGridxi = SrcInitInputData%WaveKinGridxi
   end if
   if (allocated(SrcInitInputData%WaveKinGridyi)) then
      LB(1:1) = lbound(SrcInitInputData%WaveKinGridyi)
      UB(1:1) = ubound(SrcInitInputData%WaveKinGridyi)
      if (.not. allocated(DstInitInputData%WaveKinGridyi)) then
         allocate(DstInitInputData%WaveKinGridyi(LB(1):UB(1)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstInitInputData%WaveKinGridyi.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstInitInputData%WaveKinGridyi = SrcInitInputData%WaveKinGridyi
   end if
   if (allocated(SrcInitInputData%WaveKinGridzi)) then
      LB(1:1) = lbound(SrcInitInputData%WaveKinGridzi)
      UB(1:1) = ubound(SrcInitInputData%WaveKinGridzi)
      if (.not. allocated(DstInitInputData%WaveKinGridzi)) then
         allocate(DstInitInputData%WaveKinGridzi(LB(1):UB(1)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstInitInputData%WaveKinGridzi.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstInitInputData%WaveKinGridzi = SrcInitInputData%WaveKinGridzi
   end if
   DstInitInputData%WvDiffQTFF = SrcInitInputData%WvDiffQTFF
   DstInitInputData%WvSumQTFF = SrcInitInputData%WvSumQTFF
   DstInitInputData%WvLowCOffD = SrcInitInputData%WvLowCOffD
   DstInitInputData%WvHiCOffD = SrcInitInputData%WvHiCOffD
   DstInitInputData%WvLowCOffS = SrcInitInputData%WvLowCOffS
   DstInitInputData%WvHiCOffS = SrcInitInputData%WvHiCOffS
end subroutine

subroutine Waves2_DestroyInitInput(InitInputData, ErrStat, ErrMsg)
   type(Waves2_InitInputType), intent(inout) :: InitInputData
   integer(IntKi),  intent(  out) :: ErrStat
   character(*),    intent(  out) :: ErrMsg
   character(*), parameter        :: RoutineName = 'Waves2_DestroyInitInput'
   ErrStat = ErrID_None
   ErrMsg  = ''
   nullify(InitInputData%WaveDirArr)
   nullify(InitInputData%WaveElevC0)
   if (allocated(InitInputData%WaveKinGridxi)) then
      deallocate(InitInputData%WaveKinGridxi)
   end if
   if (allocated(InitInputData%WaveKinGridyi)) then
      deallocate(InitInputData%WaveKinGridyi)
   end if
   if (allocated(InitInputData%WaveKinGridzi)) then
      deallocate(InitInputData%WaveKinGridzi)
   end if
end subroutine

subroutine Waves2_PackInitInput(Buf, Indata)
   type(PackBuffer), intent(inout) :: Buf
   type(Waves2_InitInputType), intent(in) :: InData
   character(*), parameter         :: RoutineName = 'Waves2_PackInitInput'
   logical         :: PtrInIndex
   if (Buf%ErrStat >= AbortErrLev) return
   call RegPack(Buf, InData%Gravity)
   call RegPack(Buf, InData%WtrDens)
   call RegPack(Buf, InData%WtrDpth)
   call RegPack(Buf, InData%NStepWave)
   call RegPack(Buf, InData%NStepWave2)
   call RegPack(Buf, InData%WaveDOmega)
   call RegPack(Buf, InData%WaveStMod)
   call RegPack(Buf, InData%WaveMultiDir)
   call RegPack(Buf, associated(InData%WaveDirArr))
   if (associated(InData%WaveDirArr)) then
      call RegPackBounds(Buf, 1, lbound(InData%WaveDirArr), ubound(InData%WaveDirArr))
      call RegPackPointer(Buf, c_loc(InData%WaveDirArr), PtrInIndex)
      if (.not. PtrInIndex) then
         call RegPack(Buf, InData%WaveDirArr)
      end if
   end if
   call RegPack(Buf, associated(InData%WaveElevC0))
   if (associated(InData%WaveElevC0)) then
      call RegPackBounds(Buf, 2, lbound(InData%WaveElevC0), ubound(InData%WaveElevC0))
      call RegPackPointer(Buf, c_loc(InData%WaveElevC0), PtrInIndex)
      if (.not. PtrInIndex) then
         call RegPack(Buf, InData%WaveElevC0)
      end if
   end if
   call RegPack(Buf, InData%nGrid)
   call RegPack(Buf, InData%NWaveElevGrid)
   call RegPack(Buf, InData%NWaveKinGrid)
   call RegPack(Buf, allocated(InData%WaveKinGridxi))
   if (allocated(InData%WaveKinGridxi)) then
      call RegPackBounds(Buf, 1, lbound(InData%WaveKinGridxi), ubound(InData%WaveKinGridxi))
      call RegPack(Buf, InData%WaveKinGridxi)
   end if
   call RegPack(Buf, allocated(InData%WaveKinGridyi))
   if (allocated(InData%WaveKinGridyi)) then
      call RegPackBounds(Buf, 1, lbound(InData%WaveKinGridyi), ubound(InData%WaveKinGridyi))
      call RegPack(Buf, InData%WaveKinGridyi)
   end if
   call RegPack(Buf, allocated(InData%WaveKinGridzi))
   if (allocated(InData%WaveKinGridzi)) then
      call RegPackBounds(Buf, 1, lbound(InData%WaveKinGridzi), ubound(InData%WaveKinGridzi))
      call RegPack(Buf, InData%WaveKinGridzi)
   end if
   call RegPack(Buf, InData%WvDiffQTFF)
   call RegPack(Buf, InData%WvSumQTFF)
   call RegPack(Buf, InData%WvLowCOffD)
   call RegPack(Buf, InData%WvHiCOffD)
   call RegPack(Buf, InData%WvLowCOffS)
   call RegPack(Buf, InData%WvHiCOffS)
   if (RegCheckErr(Buf, RoutineName)) return
end subroutine

subroutine Waves2_UnPackInitInput(Buf, OutData)
   type(PackBuffer), intent(inout)    :: Buf
   type(Waves2_InitInputType), intent(inout) :: OutData
   character(*), parameter            :: RoutineName = 'Waves2_UnPackInitInput'
   integer(IntKi)  :: LB(2), UB(2)
   integer(IntKi)  :: stat
   logical         :: IsAllocAssoc
   integer(IntKi)  :: PtrIdx
   type(c_ptr)     :: Ptr
   if (Buf%ErrStat /= ErrID_None) return
   call RegUnpack(Buf, OutData%Gravity)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WtrDens)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WtrDpth)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%NStepWave)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%NStepWave2)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WaveDOmega)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WaveStMod)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WaveMultiDir)
   if (RegCheckErr(Buf, RoutineName)) return
   if (associated(OutData%WaveDirArr)) deallocate(OutData%WaveDirArr)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 1, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      call RegUnpackPointer(Buf, Ptr, PtrIdx)
      if (RegCheckErr(Buf, RoutineName)) return
      if (c_associated(Ptr)) then
         call c_f_pointer(Ptr, OutData%WaveDirArr, UB(1:1)-LB(1:1))
         OutData%WaveDirArr(LB(1):) => OutData%WaveDirArr
      else
         allocate(OutData%WaveDirArr(LB(1):UB(1)),stat=stat)
         if (stat /= 0) then 
            call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveDirArr.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
            return
         end if
         Buf%Pointers(PtrIdx) = c_loc(OutData%WaveDirArr)
         call RegUnpack(Buf, OutData%WaveDirArr)
         if (RegCheckErr(Buf, RoutineName)) return
      end if
   else
      OutData%WaveDirArr => null()
   end if
   if (associated(OutData%WaveElevC0)) deallocate(OutData%WaveElevC0)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 2, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      call RegUnpackPointer(Buf, Ptr, PtrIdx)
      if (RegCheckErr(Buf, RoutineName)) return
      if (c_associated(Ptr)) then
         call c_f_pointer(Ptr, OutData%WaveElevC0, UB(1:2)-LB(1:2))
         OutData%WaveElevC0(LB(1):,LB(2):) => OutData%WaveElevC0
      else
         allocate(OutData%WaveElevC0(LB(1):UB(1),LB(2):UB(2)),stat=stat)
         if (stat /= 0) then 
            call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveElevC0.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
            return
         end if
         Buf%Pointers(PtrIdx) = c_loc(OutData%WaveElevC0)
         call RegUnpack(Buf, OutData%WaveElevC0)
         if (RegCheckErr(Buf, RoutineName)) return
      end if
   else
      OutData%WaveElevC0 => null()
   end if
   call RegUnpack(Buf, OutData%nGrid)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%NWaveElevGrid)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%NWaveKinGrid)
   if (RegCheckErr(Buf, RoutineName)) return
   if (allocated(OutData%WaveKinGridxi)) deallocate(OutData%WaveKinGridxi)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 1, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveKinGridxi(LB(1):UB(1)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveKinGridxi.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveKinGridxi)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveKinGridyi)) deallocate(OutData%WaveKinGridyi)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 1, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveKinGridyi(LB(1):UB(1)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveKinGridyi.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveKinGridyi)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveKinGridzi)) deallocate(OutData%WaveKinGridzi)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 1, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveKinGridzi(LB(1):UB(1)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveKinGridzi.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveKinGridzi)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   call RegUnpack(Buf, OutData%WvDiffQTFF)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WvSumQTFF)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WvLowCOffD)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WvHiCOffD)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WvLowCOffS)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WvHiCOffS)
   if (RegCheckErr(Buf, RoutineName)) return
end subroutine

subroutine Waves2_CopyInitOutput(SrcInitOutputData, DstInitOutputData, CtrlCode, ErrStat, ErrMsg)
   type(Waves2_InitOutputType), intent(in) :: SrcInitOutputData
   type(Waves2_InitOutputType), intent(inout) :: DstInitOutputData
   integer(IntKi),  intent(in   ) :: CtrlCode
   integer(IntKi),  intent(  out) :: ErrStat
   character(*),    intent(  out) :: ErrMsg
   integer(IntKi)                 :: LB(5), UB(5)
   integer(IntKi)                 :: ErrStat2
   character(*), parameter        :: RoutineName = 'Waves2_CopyInitOutput'
   ErrStat = ErrID_None
   ErrMsg  = ''
   if (allocated(SrcInitOutputData%WaveAcc2D)) then
      LB(1:5) = lbound(SrcInitOutputData%WaveAcc2D)
      UB(1:5) = ubound(SrcInitOutputData%WaveAcc2D)
      if (.not. allocated(DstInitOutputData%WaveAcc2D)) then
         allocate(DstInitOutputData%WaveAcc2D(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4),LB(5):UB(5)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstInitOutputData%WaveAcc2D.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstInitOutputData%WaveAcc2D = SrcInitOutputData%WaveAcc2D
   end if
   if (allocated(SrcInitOutputData%WaveDynP2D)) then
      LB(1:4) = lbound(SrcInitOutputData%WaveDynP2D)
      UB(1:4) = ubound(SrcInitOutputData%WaveDynP2D)
      if (.not. allocated(DstInitOutputData%WaveDynP2D)) then
         allocate(DstInitOutputData%WaveDynP2D(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstInitOutputData%WaveDynP2D.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstInitOutputData%WaveDynP2D = SrcInitOutputData%WaveDynP2D
   end if
   if (allocated(SrcInitOutputData%WaveAcc2S)) then
      LB(1:5) = lbound(SrcInitOutputData%WaveAcc2S)
      UB(1:5) = ubound(SrcInitOutputData%WaveAcc2S)
      if (.not. allocated(DstInitOutputData%WaveAcc2S)) then
         allocate(DstInitOutputData%WaveAcc2S(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4),LB(5):UB(5)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstInitOutputData%WaveAcc2S.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstInitOutputData%WaveAcc2S = SrcInitOutputData%WaveAcc2S
   end if
   if (allocated(SrcInitOutputData%WaveDynP2S)) then
      LB(1:4) = lbound(SrcInitOutputData%WaveDynP2S)
      UB(1:4) = ubound(SrcInitOutputData%WaveDynP2S)
      if (.not. allocated(DstInitOutputData%WaveDynP2S)) then
         allocate(DstInitOutputData%WaveDynP2S(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstInitOutputData%WaveDynP2S.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstInitOutputData%WaveDynP2S = SrcInitOutputData%WaveDynP2S
   end if
   if (allocated(SrcInitOutputData%WaveVel2D)) then
      LB(1:5) = lbound(SrcInitOutputData%WaveVel2D)
      UB(1:5) = ubound(SrcInitOutputData%WaveVel2D)
      if (.not. allocated(DstInitOutputData%WaveVel2D)) then
         allocate(DstInitOutputData%WaveVel2D(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4),LB(5):UB(5)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstInitOutputData%WaveVel2D.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstInitOutputData%WaveVel2D = SrcInitOutputData%WaveVel2D
   end if
   if (allocated(SrcInitOutputData%WaveVel2S)) then
      LB(1:5) = lbound(SrcInitOutputData%WaveVel2S)
      UB(1:5) = ubound(SrcInitOutputData%WaveVel2S)
      if (.not. allocated(DstInitOutputData%WaveVel2S)) then
         allocate(DstInitOutputData%WaveVel2S(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4),LB(5):UB(5)), stat=ErrStat2)
         if (ErrStat2 /= 0) then
            call SetErrStat(ErrID_Fatal, 'Error allocating DstInitOutputData%WaveVel2S.', ErrStat, ErrMsg, RoutineName)
            return
         end if
      end if
      DstInitOutputData%WaveVel2S = SrcInitOutputData%WaveVel2S
   end if
   DstInitOutputData%WaveElev2 => SrcInitOutputData%WaveElev2
end subroutine

subroutine Waves2_DestroyInitOutput(InitOutputData, ErrStat, ErrMsg)
   type(Waves2_InitOutputType), intent(inout) :: InitOutputData
   integer(IntKi),  intent(  out) :: ErrStat
   character(*),    intent(  out) :: ErrMsg
   character(*), parameter        :: RoutineName = 'Waves2_DestroyInitOutput'
   ErrStat = ErrID_None
   ErrMsg  = ''
   if (allocated(InitOutputData%WaveAcc2D)) then
      deallocate(InitOutputData%WaveAcc2D)
   end if
   if (allocated(InitOutputData%WaveDynP2D)) then
      deallocate(InitOutputData%WaveDynP2D)
   end if
   if (allocated(InitOutputData%WaveAcc2S)) then
      deallocate(InitOutputData%WaveAcc2S)
   end if
   if (allocated(InitOutputData%WaveDynP2S)) then
      deallocate(InitOutputData%WaveDynP2S)
   end if
   if (allocated(InitOutputData%WaveVel2D)) then
      deallocate(InitOutputData%WaveVel2D)
   end if
   if (allocated(InitOutputData%WaveVel2S)) then
      deallocate(InitOutputData%WaveVel2S)
   end if
   nullify(InitOutputData%WaveElev2)
end subroutine

subroutine Waves2_PackInitOutput(Buf, Indata)
   type(PackBuffer), intent(inout) :: Buf
   type(Waves2_InitOutputType), intent(in) :: InData
   character(*), parameter         :: RoutineName = 'Waves2_PackInitOutput'
   logical         :: PtrInIndex
   if (Buf%ErrStat >= AbortErrLev) return
   call RegPack(Buf, allocated(InData%WaveAcc2D))
   if (allocated(InData%WaveAcc2D)) then
      call RegPackBounds(Buf, 5, lbound(InData%WaveAcc2D), ubound(InData%WaveAcc2D))
      call RegPack(Buf, InData%WaveAcc2D)
   end if
   call RegPack(Buf, allocated(InData%WaveDynP2D))
   if (allocated(InData%WaveDynP2D)) then
      call RegPackBounds(Buf, 4, lbound(InData%WaveDynP2D), ubound(InData%WaveDynP2D))
      call RegPack(Buf, InData%WaveDynP2D)
   end if
   call RegPack(Buf, allocated(InData%WaveAcc2S))
   if (allocated(InData%WaveAcc2S)) then
      call RegPackBounds(Buf, 5, lbound(InData%WaveAcc2S), ubound(InData%WaveAcc2S))
      call RegPack(Buf, InData%WaveAcc2S)
   end if
   call RegPack(Buf, allocated(InData%WaveDynP2S))
   if (allocated(InData%WaveDynP2S)) then
      call RegPackBounds(Buf, 4, lbound(InData%WaveDynP2S), ubound(InData%WaveDynP2S))
      call RegPack(Buf, InData%WaveDynP2S)
   end if
   call RegPack(Buf, allocated(InData%WaveVel2D))
   if (allocated(InData%WaveVel2D)) then
      call RegPackBounds(Buf, 5, lbound(InData%WaveVel2D), ubound(InData%WaveVel2D))
      call RegPack(Buf, InData%WaveVel2D)
   end if
   call RegPack(Buf, allocated(InData%WaveVel2S))
   if (allocated(InData%WaveVel2S)) then
      call RegPackBounds(Buf, 5, lbound(InData%WaveVel2S), ubound(InData%WaveVel2S))
      call RegPack(Buf, InData%WaveVel2S)
   end if
   call RegPack(Buf, associated(InData%WaveElev2))
   if (associated(InData%WaveElev2)) then
      call RegPackBounds(Buf, 3, lbound(InData%WaveElev2), ubound(InData%WaveElev2))
      call RegPackPointer(Buf, c_loc(InData%WaveElev2), PtrInIndex)
      if (.not. PtrInIndex) then
         call RegPack(Buf, InData%WaveElev2)
      end if
   end if
   if (RegCheckErr(Buf, RoutineName)) return
end subroutine

subroutine Waves2_UnPackInitOutput(Buf, OutData)
   type(PackBuffer), intent(inout)    :: Buf
   type(Waves2_InitOutputType), intent(inout) :: OutData
   character(*), parameter            :: RoutineName = 'Waves2_UnPackInitOutput'
   integer(IntKi)  :: LB(5), UB(5)
   integer(IntKi)  :: stat
   logical         :: IsAllocAssoc
   integer(IntKi)  :: PtrIdx
   type(c_ptr)     :: Ptr
   if (Buf%ErrStat /= ErrID_None) return
   if (allocated(OutData%WaveAcc2D)) deallocate(OutData%WaveAcc2D)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 5, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveAcc2D(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4),LB(5):UB(5)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveAcc2D.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveAcc2D)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveDynP2D)) deallocate(OutData%WaveDynP2D)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 4, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveDynP2D(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveDynP2D.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveDynP2D)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveAcc2S)) deallocate(OutData%WaveAcc2S)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 5, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveAcc2S(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4),LB(5):UB(5)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveAcc2S.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveAcc2S)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveDynP2S)) deallocate(OutData%WaveDynP2S)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 4, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveDynP2S(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveDynP2S.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveDynP2S)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveVel2D)) deallocate(OutData%WaveVel2D)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 5, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveVel2D(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4),LB(5):UB(5)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveVel2D.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveVel2D)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (allocated(OutData%WaveVel2S)) deallocate(OutData%WaveVel2S)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 5, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      allocate(OutData%WaveVel2S(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3),LB(4):UB(4),LB(5):UB(5)),stat=stat)
      if (stat /= 0) then 
         call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveVel2S.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
         return
      end if
      call RegUnpack(Buf, OutData%WaveVel2S)
      if (RegCheckErr(Buf, RoutineName)) return
   end if
   if (associated(OutData%WaveElev2)) deallocate(OutData%WaveElev2)
   call RegUnpack(Buf, IsAllocAssoc)
   if (RegCheckErr(Buf, RoutineName)) return
   if (IsAllocAssoc) then
      call RegUnpackBounds(Buf, 3, LB, UB)
      if (RegCheckErr(Buf, RoutineName)) return
      call RegUnpackPointer(Buf, Ptr, PtrIdx)
      if (RegCheckErr(Buf, RoutineName)) return
      if (c_associated(Ptr)) then
         call c_f_pointer(Ptr, OutData%WaveElev2, UB(1:3)-LB(1:3))
         OutData%WaveElev2(LB(1):,LB(2):,LB(3):) => OutData%WaveElev2
      else
         allocate(OutData%WaveElev2(LB(1):UB(1),LB(2):UB(2),LB(3):UB(3)),stat=stat)
         if (stat /= 0) then 
            call SetErrStat(ErrID_Fatal, 'Error allocating OutData%WaveElev2.', Buf%ErrStat, Buf%ErrMsg, RoutineName)
            return
         end if
         Buf%Pointers(PtrIdx) = c_loc(OutData%WaveElev2)
         call RegUnpack(Buf, OutData%WaveElev2)
         if (RegCheckErr(Buf, RoutineName)) return
      end if
   else
      OutData%WaveElev2 => null()
   end if
end subroutine

subroutine Waves2_CopyParam(SrcParamData, DstParamData, CtrlCode, ErrStat, ErrMsg)
   type(Waves2_ParameterType), intent(in) :: SrcParamData
   type(Waves2_ParameterType), intent(inout) :: DstParamData
   integer(IntKi),  intent(in   ) :: CtrlCode
   integer(IntKi),  intent(  out) :: ErrStat
   character(*),    intent(  out) :: ErrMsg
   character(*), parameter        :: RoutineName = 'Waves2_CopyParam'
   ErrStat = ErrID_None
   ErrMsg  = ''
   DstParamData%WvDiffQTFF = SrcParamData%WvDiffQTFF
   DstParamData%WvSumQTFF = SrcParamData%WvSumQTFF
end subroutine

subroutine Waves2_DestroyParam(ParamData, ErrStat, ErrMsg)
   type(Waves2_ParameterType), intent(inout) :: ParamData
   integer(IntKi),  intent(  out) :: ErrStat
   character(*),    intent(  out) :: ErrMsg
   character(*), parameter        :: RoutineName = 'Waves2_DestroyParam'
   ErrStat = ErrID_None
   ErrMsg  = ''
end subroutine

subroutine Waves2_PackParam(Buf, Indata)
   type(PackBuffer), intent(inout) :: Buf
   type(Waves2_ParameterType), intent(in) :: InData
   character(*), parameter         :: RoutineName = 'Waves2_PackParam'
   if (Buf%ErrStat >= AbortErrLev) return
   call RegPack(Buf, InData%WvDiffQTFF)
   call RegPack(Buf, InData%WvSumQTFF)
   if (RegCheckErr(Buf, RoutineName)) return
end subroutine

subroutine Waves2_UnPackParam(Buf, OutData)
   type(PackBuffer), intent(inout)    :: Buf
   type(Waves2_ParameterType), intent(inout) :: OutData
   character(*), parameter            :: RoutineName = 'Waves2_UnPackParam'
   if (Buf%ErrStat /= ErrID_None) return
   call RegUnpack(Buf, OutData%WvDiffQTFF)
   if (RegCheckErr(Buf, RoutineName)) return
   call RegUnpack(Buf, OutData%WvSumQTFF)
   if (RegCheckErr(Buf, RoutineName)) return
end subroutine
END MODULE Waves2_Types
!ENDOFREGISTRYGENERATEDFILE
