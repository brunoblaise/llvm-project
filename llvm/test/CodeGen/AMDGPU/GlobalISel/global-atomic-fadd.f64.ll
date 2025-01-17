; NOTE: Assertions have been autogenerated by utils/update_mir_test_checks.py
; RUN: llc -global-isel -march=amdgcn -mcpu=gfx90a -verify-machineinstrs -stop-after=instruction-select < %s | FileCheck -check-prefix=GFX90A_GFX940 %s
; RUN: llc -global-isel -march=amdgcn -mcpu=gfx940 -verify-machineinstrs -stop-after=instruction-select < %s | FileCheck -check-prefix=GFX90A_GFX940 %s

define amdgpu_ps void @global_atomic_fadd_f64_no_rtn_intrinsic(ptr addrspace(1) %ptr, double %data) {
  ; GFX90A_GFX940-LABEL: name: global_atomic_fadd_f64_no_rtn_intrinsic
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $vgpr0, $vgpr1, $vgpr2, $vgpr3
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY1:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY]], %subreg.sub0, [[PRED_COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY2:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr2
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY3:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY2]], %subreg.sub0, [[PRED_COPY3]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   GLOBAL_ATOMIC_ADD_F64 [[REG_SEQUENCE]], [[REG_SEQUENCE1]], 0, 0, implicit $exec :: (volatile dereferenceable load store (s64) on %ir.ptr, addrspace 1)
  ; GFX90A_GFX940-NEXT:   S_ENDPGM 0
  %ret = call double @llvm.amdgcn.global.atomic.fadd.f64.p1.f64(ptr addrspace(1) %ptr, double %data)
  ret void
}

define amdgpu_ps double @global_atomic_fadd_f64_rtn_intrinsic(ptr addrspace(1) %ptr, double %data) {
  ; GFX90A_GFX940-LABEL: name: global_atomic_fadd_f64_rtn_intrinsic
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $vgpr0, $vgpr1, $vgpr2, $vgpr3
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY1:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY]], %subreg.sub0, [[PRED_COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY2:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr2
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY3:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY2]], %subreg.sub0, [[PRED_COPY3]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[GLOBAL_ATOMIC_ADD_F64_RTN:%[0-9]+]]:vreg_64_align2 = GLOBAL_ATOMIC_ADD_F64_RTN [[REG_SEQUENCE]], [[REG_SEQUENCE1]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s64) on %ir.ptr, addrspace 1)
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY4:%[0-9]+]]:vgpr_32 = PRED_COPY [[GLOBAL_ATOMIC_ADD_F64_RTN]].sub0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY5:%[0-9]+]]:vgpr_32 = PRED_COPY [[GLOBAL_ATOMIC_ADD_F64_RTN]].sub1
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[PRED_COPY4]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr0 = PRED_COPY [[V_READFIRSTLANE_B32_]]
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_1:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[PRED_COPY5]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr1 = PRED_COPY [[V_READFIRSTLANE_B32_1]]
  ; GFX90A_GFX940-NEXT:   SI_RETURN_TO_EPILOG implicit $sgpr0, implicit $sgpr1
  %ret = call double @llvm.amdgcn.global.atomic.fadd.f64.p1.f64(ptr addrspace(1) %ptr, double %data)
  ret double %ret
}

define amdgpu_ps void @global_atomic_fadd_f64_saddr_no_rtn_intrinsic(ptr addrspace(1) inreg %ptr, double %data) {
  ; GFX90A_GFX940-LABEL: name: global_atomic_fadd_f64_saddr_no_rtn_intrinsic
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $sgpr0, $sgpr1, $vgpr0, $vgpr1
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY:%[0-9]+]]:sreg_32 = PRED_COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY1:%[0-9]+]]:sreg_32 = PRED_COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:sreg_64 = REG_SEQUENCE [[PRED_COPY]], %subreg.sub0, [[PRED_COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY2:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY3:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY2]], %subreg.sub0, [[PRED_COPY3]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[V_MOV_B32_e32_:%[0-9]+]]:vgpr_32 = V_MOV_B32_e32 0, implicit $exec
  ; GFX90A_GFX940-NEXT:   GLOBAL_ATOMIC_ADD_F64_SADDR [[V_MOV_B32_e32_]], [[REG_SEQUENCE1]], [[REG_SEQUENCE]], 0, 0, implicit $exec :: (volatile dereferenceable load store (s64) on %ir.ptr, addrspace 1)
  ; GFX90A_GFX940-NEXT:   S_ENDPGM 0
  %ret = call double @llvm.amdgcn.global.atomic.fadd.f64.p1.f64(ptr addrspace(1) %ptr, double %data)
  ret void
}

define amdgpu_ps double @global_atomic_fadd_f64_saddr_rtn_intrinsic(ptr addrspace(1) inreg %ptr, double %data) {
  ; GFX90A_GFX940-LABEL: name: global_atomic_fadd_f64_saddr_rtn_intrinsic
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $sgpr0, $sgpr1, $vgpr0, $vgpr1
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY:%[0-9]+]]:sreg_32 = PRED_COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY1:%[0-9]+]]:sreg_32 = PRED_COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:sreg_64 = REG_SEQUENCE [[PRED_COPY]], %subreg.sub0, [[PRED_COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY2:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY3:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY2]], %subreg.sub0, [[PRED_COPY3]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[V_MOV_B32_e32_:%[0-9]+]]:vgpr_32 = V_MOV_B32_e32 0, implicit $exec
  ; GFX90A_GFX940-NEXT:   [[GLOBAL_ATOMIC_ADD_F64_SADDR_RTN:%[0-9]+]]:vreg_64_align2 = GLOBAL_ATOMIC_ADD_F64_SADDR_RTN [[V_MOV_B32_e32_]], [[REG_SEQUENCE1]], [[REG_SEQUENCE]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s64) on %ir.ptr, addrspace 1)
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY4:%[0-9]+]]:vgpr_32 = PRED_COPY [[GLOBAL_ATOMIC_ADD_F64_SADDR_RTN]].sub0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY5:%[0-9]+]]:vgpr_32 = PRED_COPY [[GLOBAL_ATOMIC_ADD_F64_SADDR_RTN]].sub1
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[PRED_COPY4]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr0 = PRED_COPY [[V_READFIRSTLANE_B32_]]
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_1:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[PRED_COPY5]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr1 = PRED_COPY [[V_READFIRSTLANE_B32_1]]
  ; GFX90A_GFX940-NEXT:   SI_RETURN_TO_EPILOG implicit $sgpr0, implicit $sgpr1
  %ret = call double @llvm.amdgcn.global.atomic.fadd.f64.p1.f64(ptr addrspace(1) %ptr, double %data)
  ret double %ret
}

define amdgpu_ps void @global_atomic_fadd_f64_no_rtn_flat_intrinsic(ptr addrspace(1) %ptr, double %data) {
  ; GFX90A_GFX940-LABEL: name: global_atomic_fadd_f64_no_rtn_flat_intrinsic
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $vgpr0, $vgpr1, $vgpr2, $vgpr3
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY1:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY]], %subreg.sub0, [[PRED_COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY2:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr2
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY3:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY2]], %subreg.sub0, [[PRED_COPY3]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   GLOBAL_ATOMIC_ADD_F64 [[REG_SEQUENCE]], [[REG_SEQUENCE1]], 0, 0, implicit $exec :: (volatile dereferenceable load store (s64) on %ir.ptr, addrspace 1)
  ; GFX90A_GFX940-NEXT:   S_ENDPGM 0
  %ret = call double @llvm.amdgcn.flat.atomic.fadd.f64.p1.f64(ptr addrspace(1) %ptr, double %data)
  ret void
}

define amdgpu_ps double @global_atomic_fadd_f64_rtn_flat_intrinsic(ptr addrspace(1) %ptr, double %data) {
  ; GFX90A_GFX940-LABEL: name: global_atomic_fadd_f64_rtn_flat_intrinsic
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $vgpr0, $vgpr1, $vgpr2, $vgpr3
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY1:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY]], %subreg.sub0, [[PRED_COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY2:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr2
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY3:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY2]], %subreg.sub0, [[PRED_COPY3]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[GLOBAL_ATOMIC_ADD_F64_RTN:%[0-9]+]]:vreg_64_align2 = GLOBAL_ATOMIC_ADD_F64_RTN [[REG_SEQUENCE]], [[REG_SEQUENCE1]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s64) on %ir.ptr, addrspace 1)
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY4:%[0-9]+]]:vgpr_32 = PRED_COPY [[GLOBAL_ATOMIC_ADD_F64_RTN]].sub0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY5:%[0-9]+]]:vgpr_32 = PRED_COPY [[GLOBAL_ATOMIC_ADD_F64_RTN]].sub1
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[PRED_COPY4]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr0 = PRED_COPY [[V_READFIRSTLANE_B32_]]
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_1:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[PRED_COPY5]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr1 = PRED_COPY [[V_READFIRSTLANE_B32_1]]
  ; GFX90A_GFX940-NEXT:   SI_RETURN_TO_EPILOG implicit $sgpr0, implicit $sgpr1
  %ret = call double @llvm.amdgcn.flat.atomic.fadd.f64.p1.f64(ptr addrspace(1) %ptr, double %data)
  ret double %ret
}

define amdgpu_ps void @global_atomic_fadd_f64_saddr_no_rtn_flat_intrinsic(ptr addrspace(1) inreg %ptr, double %data) {
  ; GFX90A_GFX940-LABEL: name: global_atomic_fadd_f64_saddr_no_rtn_flat_intrinsic
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $sgpr0, $sgpr1, $vgpr0, $vgpr1
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY:%[0-9]+]]:sreg_32 = PRED_COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY1:%[0-9]+]]:sreg_32 = PRED_COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:sreg_64 = REG_SEQUENCE [[PRED_COPY]], %subreg.sub0, [[PRED_COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY2:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY3:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY2]], %subreg.sub0, [[PRED_COPY3]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[V_MOV_B32_e32_:%[0-9]+]]:vgpr_32 = V_MOV_B32_e32 0, implicit $exec
  ; GFX90A_GFX940-NEXT:   GLOBAL_ATOMIC_ADD_F64_SADDR [[V_MOV_B32_e32_]], [[REG_SEQUENCE1]], [[REG_SEQUENCE]], 0, 0, implicit $exec :: (volatile dereferenceable load store (s64) on %ir.ptr, addrspace 1)
  ; GFX90A_GFX940-NEXT:   S_ENDPGM 0
  %ret = call double @llvm.amdgcn.flat.atomic.fadd.f64.p1.f64(ptr addrspace(1) %ptr, double %data)
  ret void
}

define amdgpu_ps double @global_atomic_fadd_f64_saddr_rtn_flat_intrinsic(ptr addrspace(1) inreg %ptr, double %data) {
  ; GFX90A_GFX940-LABEL: name: global_atomic_fadd_f64_saddr_rtn_flat_intrinsic
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $sgpr0, $sgpr1, $vgpr0, $vgpr1
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY:%[0-9]+]]:sreg_32 = PRED_COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY1:%[0-9]+]]:sreg_32 = PRED_COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:sreg_64 = REG_SEQUENCE [[PRED_COPY]], %subreg.sub0, [[PRED_COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY2:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY3:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY2]], %subreg.sub0, [[PRED_COPY3]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[V_MOV_B32_e32_:%[0-9]+]]:vgpr_32 = V_MOV_B32_e32 0, implicit $exec
  ; GFX90A_GFX940-NEXT:   [[GLOBAL_ATOMIC_ADD_F64_SADDR_RTN:%[0-9]+]]:vreg_64_align2 = GLOBAL_ATOMIC_ADD_F64_SADDR_RTN [[V_MOV_B32_e32_]], [[REG_SEQUENCE1]], [[REG_SEQUENCE]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s64) on %ir.ptr, addrspace 1)
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY4:%[0-9]+]]:vgpr_32 = PRED_COPY [[GLOBAL_ATOMIC_ADD_F64_SADDR_RTN]].sub0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY5:%[0-9]+]]:vgpr_32 = PRED_COPY [[GLOBAL_ATOMIC_ADD_F64_SADDR_RTN]].sub1
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[PRED_COPY4]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr0 = PRED_COPY [[V_READFIRSTLANE_B32_]]
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_1:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[PRED_COPY5]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr1 = PRED_COPY [[V_READFIRSTLANE_B32_1]]
  ; GFX90A_GFX940-NEXT:   SI_RETURN_TO_EPILOG implicit $sgpr0, implicit $sgpr1
  %ret = call double @llvm.amdgcn.flat.atomic.fadd.f64.p1.f64(ptr addrspace(1) %ptr, double %data)
  ret double %ret
}

define amdgpu_ps void @global_atomic_fadd_f64_no_rtn_atomicrmw(ptr addrspace(1) %ptr, double %data) #0 {
  ; GFX90A_GFX940-LABEL: name: global_atomic_fadd_f64_no_rtn_atomicrmw
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $vgpr0, $vgpr1, $vgpr2, $vgpr3
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY1:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY]], %subreg.sub0, [[PRED_COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY2:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr2
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY3:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY2]], %subreg.sub0, [[PRED_COPY3]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   GLOBAL_ATOMIC_ADD_F64 [[REG_SEQUENCE]], [[REG_SEQUENCE1]], 0, 0, implicit $exec :: (load store syncscope("wavefront") monotonic (s64) on %ir.ptr, addrspace 1)
  ; GFX90A_GFX940-NEXT:   S_ENDPGM 0
  %ret = atomicrmw fadd ptr addrspace(1) %ptr, double %data syncscope("wavefront") monotonic
  ret void
}

define amdgpu_ps double @global_atomic_fadd_f64_rtn_atomicrmw(ptr addrspace(1) %ptr, double %data) #0 {
  ; GFX90A_GFX940-LABEL: name: global_atomic_fadd_f64_rtn_atomicrmw
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $vgpr0, $vgpr1, $vgpr2, $vgpr3
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY1:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY]], %subreg.sub0, [[PRED_COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY2:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr2
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY3:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY2]], %subreg.sub0, [[PRED_COPY3]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[GLOBAL_ATOMIC_ADD_F64_RTN:%[0-9]+]]:vreg_64_align2 = GLOBAL_ATOMIC_ADD_F64_RTN [[REG_SEQUENCE]], [[REG_SEQUENCE1]], 0, 1, implicit $exec :: (load store syncscope("wavefront") monotonic (s64) on %ir.ptr, addrspace 1)
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY4:%[0-9]+]]:vgpr_32 = PRED_COPY [[GLOBAL_ATOMIC_ADD_F64_RTN]].sub0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY5:%[0-9]+]]:vgpr_32 = PRED_COPY [[GLOBAL_ATOMIC_ADD_F64_RTN]].sub1
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[PRED_COPY4]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr0 = PRED_COPY [[V_READFIRSTLANE_B32_]]
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_1:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[PRED_COPY5]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr1 = PRED_COPY [[V_READFIRSTLANE_B32_1]]
  ; GFX90A_GFX940-NEXT:   SI_RETURN_TO_EPILOG implicit $sgpr0, implicit $sgpr1
  %ret = atomicrmw fadd ptr addrspace(1) %ptr, double %data syncscope("wavefront") monotonic
  ret double %ret
}

define amdgpu_ps void @global_atomic_fadd_f64_saddr_no_rtn_atomicrmw(ptr addrspace(1) inreg %ptr, double %data) #0 {
  ; GFX90A_GFX940-LABEL: name: global_atomic_fadd_f64_saddr_no_rtn_atomicrmw
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $sgpr0, $sgpr1, $vgpr0, $vgpr1
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY:%[0-9]+]]:sreg_32 = PRED_COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY1:%[0-9]+]]:sreg_32 = PRED_COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:sreg_64 = REG_SEQUENCE [[PRED_COPY]], %subreg.sub0, [[PRED_COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY2:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY3:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY2]], %subreg.sub0, [[PRED_COPY3]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[V_MOV_B32_e32_:%[0-9]+]]:vgpr_32 = V_MOV_B32_e32 0, implicit $exec
  ; GFX90A_GFX940-NEXT:   GLOBAL_ATOMIC_ADD_F64_SADDR [[V_MOV_B32_e32_]], [[REG_SEQUENCE1]], [[REG_SEQUENCE]], 0, 0, implicit $exec :: (load store syncscope("wavefront") monotonic (s64) on %ir.ptr, addrspace 1)
  ; GFX90A_GFX940-NEXT:   S_ENDPGM 0
  %ret = atomicrmw fadd ptr addrspace(1) %ptr, double %data syncscope("wavefront") monotonic
  ret void
}

define amdgpu_ps double @global_atomic_fadd_f64_saddr_rtn_atomicrmw(ptr addrspace(1) inreg %ptr, double %data) #0 {
  ; GFX90A_GFX940-LABEL: name: global_atomic_fadd_f64_saddr_rtn_atomicrmw
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $sgpr0, $sgpr1, $vgpr0, $vgpr1
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY:%[0-9]+]]:sreg_32 = PRED_COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY1:%[0-9]+]]:sreg_32 = PRED_COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:sreg_64 = REG_SEQUENCE [[PRED_COPY]], %subreg.sub0, [[PRED_COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY2:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY3:%[0-9]+]]:vgpr_32 = PRED_COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[PRED_COPY2]], %subreg.sub0, [[PRED_COPY3]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[V_MOV_B32_e32_:%[0-9]+]]:vgpr_32 = V_MOV_B32_e32 0, implicit $exec
  ; GFX90A_GFX940-NEXT:   [[GLOBAL_ATOMIC_ADD_F64_SADDR_RTN:%[0-9]+]]:vreg_64_align2 = GLOBAL_ATOMIC_ADD_F64_SADDR_RTN [[V_MOV_B32_e32_]], [[REG_SEQUENCE1]], [[REG_SEQUENCE]], 0, 1, implicit $exec :: (load store syncscope("wavefront") monotonic (s64) on %ir.ptr, addrspace 1)
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY4:%[0-9]+]]:vgpr_32 = PRED_COPY [[GLOBAL_ATOMIC_ADD_F64_SADDR_RTN]].sub0
  ; GFX90A_GFX940-NEXT:   [[PRED_COPY5:%[0-9]+]]:vgpr_32 = PRED_COPY [[GLOBAL_ATOMIC_ADD_F64_SADDR_RTN]].sub1
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[PRED_COPY4]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr0 = PRED_COPY [[V_READFIRSTLANE_B32_]]
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_1:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[PRED_COPY5]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr1 = PRED_COPY [[V_READFIRSTLANE_B32_1]]
  ; GFX90A_GFX940-NEXT:   SI_RETURN_TO_EPILOG implicit $sgpr0, implicit $sgpr1
  %ret = atomicrmw fadd ptr addrspace(1) %ptr, double %data syncscope("wavefront") monotonic
  ret double %ret
}

declare double @llvm.amdgcn.global.atomic.fadd.f64.p1.f64(ptr addrspace(1), double)
declare double @llvm.amdgcn.flat.atomic.fadd.f64.p1.f64(ptr addrspace(1), double)

attributes #0 = {"amdgpu-unsafe-fp-atomics"="true" }
