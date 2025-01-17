; NOTE: Assertions have been autogenerated by utils/update_mir_test_checks.py
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdhsa -stop-after=irtranslator -o - %s | FileCheck %s

; Test 64-bit pointer with 64-bit index
define <2 x ptr addrspace(1)> @vector_gep_v2p1_index_v2i64(<2 x ptr addrspace(1)> %ptr, <2 x i64> %idx) {
  ; CHECK-LABEL: name: vector_gep_v2p1_index_v2i64
  ; CHECK: bb.1 (%ir-block.0):
  ; CHECK-NEXT:   liveins: $vgpr0, $vgpr1, $vgpr2, $vgpr3, $vgpr4, $vgpr5, $vgpr6, $vgpr7
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[PRED_COPY:%[0-9]+]]:_(s32) = PRED_COPY $vgpr0
  ; CHECK-NEXT:   [[PRED_COPY1:%[0-9]+]]:_(s32) = PRED_COPY $vgpr1
  ; CHECK-NEXT:   [[PRED_COPY2:%[0-9]+]]:_(s32) = PRED_COPY $vgpr2
  ; CHECK-NEXT:   [[PRED_COPY3:%[0-9]+]]:_(s32) = PRED_COPY $vgpr3
  ; CHECK-NEXT:   [[MV:%[0-9]+]]:_(p1) = G_MERGE_VALUES [[PRED_COPY]](s32), [[PRED_COPY1]](s32)
  ; CHECK-NEXT:   [[MV1:%[0-9]+]]:_(p1) = G_MERGE_VALUES [[PRED_COPY2]](s32), [[PRED_COPY3]](s32)
  ; CHECK-NEXT:   [[BUILD_VECTOR:%[0-9]+]]:_(<2 x p1>) = G_BUILD_VECTOR [[MV]](p1), [[MV1]](p1)
  ; CHECK-NEXT:   [[PRED_COPY4:%[0-9]+]]:_(s32) = PRED_COPY $vgpr4
  ; CHECK-NEXT:   [[PRED_COPY5:%[0-9]+]]:_(s32) = PRED_COPY $vgpr5
  ; CHECK-NEXT:   [[PRED_COPY6:%[0-9]+]]:_(s32) = PRED_COPY $vgpr6
  ; CHECK-NEXT:   [[PRED_COPY7:%[0-9]+]]:_(s32) = PRED_COPY $vgpr7
  ; CHECK-NEXT:   [[MV2:%[0-9]+]]:_(s64) = G_MERGE_VALUES [[PRED_COPY4]](s32), [[PRED_COPY5]](s32)
  ; CHECK-NEXT:   [[MV3:%[0-9]+]]:_(s64) = G_MERGE_VALUES [[PRED_COPY6]](s32), [[PRED_COPY7]](s32)
  ; CHECK-NEXT:   [[BUILD_VECTOR1:%[0-9]+]]:_(<2 x s64>) = G_BUILD_VECTOR [[MV2]](s64), [[MV3]](s64)
  ; CHECK-NEXT:   [[C:%[0-9]+]]:_(s64) = G_CONSTANT i64 4
  ; CHECK-NEXT:   [[BUILD_VECTOR2:%[0-9]+]]:_(<2 x s64>) = G_BUILD_VECTOR [[C]](s64), [[C]](s64)
  ; CHECK-NEXT:   [[MUL:%[0-9]+]]:_(<2 x s64>) = G_MUL [[BUILD_VECTOR1]], [[BUILD_VECTOR2]]
  ; CHECK-NEXT:   [[PTR_ADD:%[0-9]+]]:_(<2 x p1>) = G_PTR_ADD [[BUILD_VECTOR]], [[MUL]](<2 x s64>)
  ; CHECK-NEXT:   [[PRED_COPY8:%[0-9]+]]:_(<2 x p1>) = PRED_COPY [[PTR_ADD]](<2 x p1>)
  ; CHECK-NEXT:   [[UV:%[0-9]+]]:_(s32), [[UV1:%[0-9]+]]:_(s32), [[UV2:%[0-9]+]]:_(s32), [[UV3:%[0-9]+]]:_(s32) = G_UNMERGE_VALUES [[PRED_COPY8]](<2 x p1>)
  ; CHECK-NEXT:   $vgpr0 = PRED_COPY [[UV]](s32)
  ; CHECK-NEXT:   $vgpr1 = PRED_COPY [[UV1]](s32)
  ; CHECK-NEXT:   $vgpr2 = PRED_COPY [[UV2]](s32)
  ; CHECK-NEXT:   $vgpr3 = PRED_COPY [[UV3]](s32)
  ; CHECK-NEXT:   SI_RETURN implicit $vgpr0, implicit $vgpr1, implicit $vgpr2, implicit $vgpr3
  %gep = getelementptr i32, <2 x ptr addrspace(1)> %ptr, <2 x i64> %idx
  ret <2 x ptr addrspace(1)> %gep
}

; Test 32-bit pointer with 32-bit index
define <2 x ptr addrspace(3)> @vector_gep_v2p3_index_v2i32(<2 x ptr addrspace(3)> %ptr, <2 x i32> %idx) {
  ; CHECK-LABEL: name: vector_gep_v2p3_index_v2i32
  ; CHECK: bb.1 (%ir-block.0):
  ; CHECK-NEXT:   liveins: $vgpr0, $vgpr1, $vgpr2, $vgpr3
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[PRED_COPY:%[0-9]+]]:_(p3) = PRED_COPY $vgpr0
  ; CHECK-NEXT:   [[PRED_COPY1:%[0-9]+]]:_(p3) = PRED_COPY $vgpr1
  ; CHECK-NEXT:   [[BUILD_VECTOR:%[0-9]+]]:_(<2 x p3>) = G_BUILD_VECTOR [[PRED_COPY]](p3), [[PRED_COPY1]](p3)
  ; CHECK-NEXT:   [[PRED_COPY2:%[0-9]+]]:_(s32) = PRED_COPY $vgpr2
  ; CHECK-NEXT:   [[PRED_COPY3:%[0-9]+]]:_(s32) = PRED_COPY $vgpr3
  ; CHECK-NEXT:   [[BUILD_VECTOR1:%[0-9]+]]:_(<2 x s32>) = G_BUILD_VECTOR [[PRED_COPY2]](s32), [[PRED_COPY3]](s32)
  ; CHECK-NEXT:   [[C:%[0-9]+]]:_(s32) = G_CONSTANT i32 4
  ; CHECK-NEXT:   [[BUILD_VECTOR2:%[0-9]+]]:_(<2 x s32>) = G_BUILD_VECTOR [[C]](s32), [[C]](s32)
  ; CHECK-NEXT:   [[MUL:%[0-9]+]]:_(<2 x s32>) = G_MUL [[BUILD_VECTOR1]], [[BUILD_VECTOR2]]
  ; CHECK-NEXT:   [[PTR_ADD:%[0-9]+]]:_(<2 x p3>) = G_PTR_ADD [[BUILD_VECTOR]], [[MUL]](<2 x s32>)
  ; CHECK-NEXT:   [[PRED_COPY4:%[0-9]+]]:_(<2 x p3>) = PRED_COPY [[PTR_ADD]](<2 x p3>)
  ; CHECK-NEXT:   [[UV:%[0-9]+]]:_(s32), [[UV1:%[0-9]+]]:_(s32) = G_UNMERGE_VALUES [[PRED_COPY4]](<2 x p3>)
  ; CHECK-NEXT:   $vgpr0 = PRED_COPY [[UV]](s32)
  ; CHECK-NEXT:   $vgpr1 = PRED_COPY [[UV1]](s32)
  ; CHECK-NEXT:   SI_RETURN implicit $vgpr0, implicit $vgpr1
  %gep = getelementptr i32, <2 x ptr addrspace(3)> %ptr, <2 x i32> %idx
  ret <2 x ptr addrspace(3)> %gep
}

; Test 64-bit pointer with 32-bit index
define <2 x ptr addrspace(1)> @vector_gep_v2p1_index_v2i32(<2 x ptr addrspace(1)> %ptr, <2 x i32> %idx) {
  ; CHECK-LABEL: name: vector_gep_v2p1_index_v2i32
  ; CHECK: bb.1 (%ir-block.0):
  ; CHECK-NEXT:   liveins: $vgpr0, $vgpr1, $vgpr2, $vgpr3, $vgpr4, $vgpr5
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[PRED_COPY:%[0-9]+]]:_(s32) = PRED_COPY $vgpr0
  ; CHECK-NEXT:   [[PRED_COPY1:%[0-9]+]]:_(s32) = PRED_COPY $vgpr1
  ; CHECK-NEXT:   [[PRED_COPY2:%[0-9]+]]:_(s32) = PRED_COPY $vgpr2
  ; CHECK-NEXT:   [[PRED_COPY3:%[0-9]+]]:_(s32) = PRED_COPY $vgpr3
  ; CHECK-NEXT:   [[MV:%[0-9]+]]:_(p1) = G_MERGE_VALUES [[PRED_COPY]](s32), [[PRED_COPY1]](s32)
  ; CHECK-NEXT:   [[MV1:%[0-9]+]]:_(p1) = G_MERGE_VALUES [[PRED_COPY2]](s32), [[PRED_COPY3]](s32)
  ; CHECK-NEXT:   [[BUILD_VECTOR:%[0-9]+]]:_(<2 x p1>) = G_BUILD_VECTOR [[MV]](p1), [[MV1]](p1)
  ; CHECK-NEXT:   [[PRED_COPY4:%[0-9]+]]:_(s32) = PRED_COPY $vgpr4
  ; CHECK-NEXT:   [[PRED_COPY5:%[0-9]+]]:_(s32) = PRED_COPY $vgpr5
  ; CHECK-NEXT:   [[BUILD_VECTOR1:%[0-9]+]]:_(<2 x s32>) = G_BUILD_VECTOR [[PRED_COPY4]](s32), [[PRED_COPY5]](s32)
  ; CHECK-NEXT:   [[SEXT:%[0-9]+]]:_(<2 x s64>) = G_SEXT [[BUILD_VECTOR1]](<2 x s32>)
  ; CHECK-NEXT:   [[C:%[0-9]+]]:_(s64) = G_CONSTANT i64 4
  ; CHECK-NEXT:   [[BUILD_VECTOR2:%[0-9]+]]:_(<2 x s64>) = G_BUILD_VECTOR [[C]](s64), [[C]](s64)
  ; CHECK-NEXT:   [[MUL:%[0-9]+]]:_(<2 x s64>) = G_MUL [[SEXT]], [[BUILD_VECTOR2]]
  ; CHECK-NEXT:   [[PTR_ADD:%[0-9]+]]:_(<2 x p1>) = G_PTR_ADD [[BUILD_VECTOR]], [[MUL]](<2 x s64>)
  ; CHECK-NEXT:   [[PRED_COPY6:%[0-9]+]]:_(<2 x p1>) = PRED_COPY [[PTR_ADD]](<2 x p1>)
  ; CHECK-NEXT:   [[UV:%[0-9]+]]:_(s32), [[UV1:%[0-9]+]]:_(s32), [[UV2:%[0-9]+]]:_(s32), [[UV3:%[0-9]+]]:_(s32) = G_UNMERGE_VALUES [[PRED_COPY6]](<2 x p1>)
  ; CHECK-NEXT:   $vgpr0 = PRED_COPY [[UV]](s32)
  ; CHECK-NEXT:   $vgpr1 = PRED_COPY [[UV1]](s32)
  ; CHECK-NEXT:   $vgpr2 = PRED_COPY [[UV2]](s32)
  ; CHECK-NEXT:   $vgpr3 = PRED_COPY [[UV3]](s32)
  ; CHECK-NEXT:   SI_RETURN implicit $vgpr0, implicit $vgpr1, implicit $vgpr2, implicit $vgpr3
  %gep = getelementptr i32, <2 x ptr addrspace(1)> %ptr, <2 x i32> %idx
  ret <2 x ptr addrspace(1)> %gep
}

; Test 64-bit pointer with 64-bit scalar index
define <2 x ptr addrspace(1)> @vector_gep_v2p1_index_i64(<2 x ptr addrspace(1)> %ptr, i64 %idx) {
  ; CHECK-LABEL: name: vector_gep_v2p1_index_i64
  ; CHECK: bb.1 (%ir-block.0):
  ; CHECK-NEXT:   liveins: $vgpr0, $vgpr1, $vgpr2, $vgpr3, $vgpr4, $vgpr5
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[PRED_COPY:%[0-9]+]]:_(s32) = PRED_COPY $vgpr0
  ; CHECK-NEXT:   [[PRED_COPY1:%[0-9]+]]:_(s32) = PRED_COPY $vgpr1
  ; CHECK-NEXT:   [[PRED_COPY2:%[0-9]+]]:_(s32) = PRED_COPY $vgpr2
  ; CHECK-NEXT:   [[PRED_COPY3:%[0-9]+]]:_(s32) = PRED_COPY $vgpr3
  ; CHECK-NEXT:   [[MV:%[0-9]+]]:_(p1) = G_MERGE_VALUES [[PRED_COPY]](s32), [[PRED_COPY1]](s32)
  ; CHECK-NEXT:   [[MV1:%[0-9]+]]:_(p1) = G_MERGE_VALUES [[PRED_COPY2]](s32), [[PRED_COPY3]](s32)
  ; CHECK-NEXT:   [[BUILD_VECTOR:%[0-9]+]]:_(<2 x p1>) = G_BUILD_VECTOR [[MV]](p1), [[MV1]](p1)
  ; CHECK-NEXT:   [[PRED_COPY4:%[0-9]+]]:_(s32) = PRED_COPY $vgpr4
  ; CHECK-NEXT:   [[PRED_COPY5:%[0-9]+]]:_(s32) = PRED_COPY $vgpr5
  ; CHECK-NEXT:   [[MV2:%[0-9]+]]:_(s64) = G_MERGE_VALUES [[PRED_COPY4]](s32), [[PRED_COPY5]](s32)
  ; CHECK-NEXT:   [[BUILD_VECTOR1:%[0-9]+]]:_(<2 x s64>) = G_BUILD_VECTOR [[MV2]](s64), [[MV2]](s64)
  ; CHECK-NEXT:   [[PRED_COPY6:%[0-9]+]]:_(<2 x s64>) = PRED_COPY [[BUILD_VECTOR1]](<2 x s64>)
  ; CHECK-NEXT:   [[C:%[0-9]+]]:_(s64) = G_CONSTANT i64 4
  ; CHECK-NEXT:   [[BUILD_VECTOR2:%[0-9]+]]:_(<2 x s64>) = G_BUILD_VECTOR [[C]](s64), [[C]](s64)
  ; CHECK-NEXT:   [[MUL:%[0-9]+]]:_(<2 x s64>) = G_MUL [[PRED_COPY6]], [[BUILD_VECTOR2]]
  ; CHECK-NEXT:   [[PTR_ADD:%[0-9]+]]:_(<2 x p1>) = G_PTR_ADD [[BUILD_VECTOR]], [[MUL]](<2 x s64>)
  ; CHECK-NEXT:   [[PRED_COPY7:%[0-9]+]]:_(<2 x p1>) = PRED_COPY [[PTR_ADD]](<2 x p1>)
  ; CHECK-NEXT:   [[UV:%[0-9]+]]:_(s32), [[UV1:%[0-9]+]]:_(s32), [[UV2:%[0-9]+]]:_(s32), [[UV3:%[0-9]+]]:_(s32) = G_UNMERGE_VALUES [[PRED_COPY7]](<2 x p1>)
  ; CHECK-NEXT:   $vgpr0 = PRED_COPY [[UV]](s32)
  ; CHECK-NEXT:   $vgpr1 = PRED_COPY [[UV1]](s32)
  ; CHECK-NEXT:   $vgpr2 = PRED_COPY [[UV2]](s32)
  ; CHECK-NEXT:   $vgpr3 = PRED_COPY [[UV3]](s32)
  ; CHECK-NEXT:   SI_RETURN implicit $vgpr0, implicit $vgpr1, implicit $vgpr2, implicit $vgpr3
  %gep = getelementptr i32, <2 x ptr addrspace(1)> %ptr, i64 %idx
  ret <2 x ptr addrspace(1)> %gep
}

; Test 64-bit pointer with 32-bit scalar index
define <2 x ptr addrspace(1)> @vector_gep_v2p1_index_i32(<2 x ptr addrspace(1)> %ptr, i32 %idx) {
  ; CHECK-LABEL: name: vector_gep_v2p1_index_i32
  ; CHECK: bb.1 (%ir-block.0):
  ; CHECK-NEXT:   liveins: $vgpr0, $vgpr1, $vgpr2, $vgpr3, $vgpr4
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[PRED_COPY:%[0-9]+]]:_(s32) = PRED_COPY $vgpr0
  ; CHECK-NEXT:   [[PRED_COPY1:%[0-9]+]]:_(s32) = PRED_COPY $vgpr1
  ; CHECK-NEXT:   [[PRED_COPY2:%[0-9]+]]:_(s32) = PRED_COPY $vgpr2
  ; CHECK-NEXT:   [[PRED_COPY3:%[0-9]+]]:_(s32) = PRED_COPY $vgpr3
  ; CHECK-NEXT:   [[MV:%[0-9]+]]:_(p1) = G_MERGE_VALUES [[PRED_COPY]](s32), [[PRED_COPY1]](s32)
  ; CHECK-NEXT:   [[MV1:%[0-9]+]]:_(p1) = G_MERGE_VALUES [[PRED_COPY2]](s32), [[PRED_COPY3]](s32)
  ; CHECK-NEXT:   [[BUILD_VECTOR:%[0-9]+]]:_(<2 x p1>) = G_BUILD_VECTOR [[MV]](p1), [[MV1]](p1)
  ; CHECK-NEXT:   [[PRED_COPY4:%[0-9]+]]:_(s32) = PRED_COPY $vgpr4
  ; CHECK-NEXT:   [[BUILD_VECTOR1:%[0-9]+]]:_(<2 x s32>) = G_BUILD_VECTOR [[PRED_COPY4]](s32), [[PRED_COPY4]](s32)
  ; CHECK-NEXT:   [[SEXT:%[0-9]+]]:_(<2 x s64>) = G_SEXT [[BUILD_VECTOR1]](<2 x s32>)
  ; CHECK-NEXT:   [[C:%[0-9]+]]:_(s64) = G_CONSTANT i64 4
  ; CHECK-NEXT:   [[BUILD_VECTOR2:%[0-9]+]]:_(<2 x s64>) = G_BUILD_VECTOR [[C]](s64), [[C]](s64)
  ; CHECK-NEXT:   [[MUL:%[0-9]+]]:_(<2 x s64>) = G_MUL [[SEXT]], [[BUILD_VECTOR2]]
  ; CHECK-NEXT:   [[PTR_ADD:%[0-9]+]]:_(<2 x p1>) = G_PTR_ADD [[BUILD_VECTOR]], [[MUL]](<2 x s64>)
  ; CHECK-NEXT:   [[PRED_COPY5:%[0-9]+]]:_(<2 x p1>) = PRED_COPY [[PTR_ADD]](<2 x p1>)
  ; CHECK-NEXT:   [[UV:%[0-9]+]]:_(s32), [[UV1:%[0-9]+]]:_(s32), [[UV2:%[0-9]+]]:_(s32), [[UV3:%[0-9]+]]:_(s32) = G_UNMERGE_VALUES [[PRED_COPY5]](<2 x p1>)
  ; CHECK-NEXT:   $vgpr0 = PRED_COPY [[UV]](s32)
  ; CHECK-NEXT:   $vgpr1 = PRED_COPY [[UV1]](s32)
  ; CHECK-NEXT:   $vgpr2 = PRED_COPY [[UV2]](s32)
  ; CHECK-NEXT:   $vgpr3 = PRED_COPY [[UV3]](s32)
  ; CHECK-NEXT:   SI_RETURN implicit $vgpr0, implicit $vgpr1, implicit $vgpr2, implicit $vgpr3
  %gep = getelementptr i32, <2 x ptr addrspace(1)> %ptr, i32 %idx
  ret <2 x ptr addrspace(1)> %gep
}

; Test 64-bit pointer with 64-bit constant, non-splat
define <2 x ptr addrspace(1)> @vector_gep_v2p1_index_v2i64_constant(<2 x ptr addrspace(1)> %ptr, <2 x i64> %idx) {
  ; CHECK-LABEL: name: vector_gep_v2p1_index_v2i64_constant
  ; CHECK: bb.1 (%ir-block.0):
  ; CHECK-NEXT:   liveins: $vgpr0, $vgpr1, $vgpr2, $vgpr3, $vgpr4, $vgpr5, $vgpr6, $vgpr7
  ; CHECK-NEXT: {{  $}}
  ; CHECK-NEXT:   [[PRED_COPY:%[0-9]+]]:_(s32) = PRED_COPY $vgpr0
  ; CHECK-NEXT:   [[PRED_COPY1:%[0-9]+]]:_(s32) = PRED_COPY $vgpr1
  ; CHECK-NEXT:   [[PRED_COPY2:%[0-9]+]]:_(s32) = PRED_COPY $vgpr2
  ; CHECK-NEXT:   [[PRED_COPY3:%[0-9]+]]:_(s32) = PRED_COPY $vgpr3
  ; CHECK-NEXT:   [[MV:%[0-9]+]]:_(p1) = G_MERGE_VALUES [[PRED_COPY]](s32), [[PRED_COPY1]](s32)
  ; CHECK-NEXT:   [[MV1:%[0-9]+]]:_(p1) = G_MERGE_VALUES [[PRED_COPY2]](s32), [[PRED_COPY3]](s32)
  ; CHECK-NEXT:   [[BUILD_VECTOR:%[0-9]+]]:_(<2 x p1>) = G_BUILD_VECTOR [[MV]](p1), [[MV1]](p1)
  ; CHECK-NEXT:   [[PRED_COPY4:%[0-9]+]]:_(s32) = PRED_COPY $vgpr4
  ; CHECK-NEXT:   [[PRED_COPY5:%[0-9]+]]:_(s32) = PRED_COPY $vgpr5
  ; CHECK-NEXT:   [[PRED_COPY6:%[0-9]+]]:_(s32) = PRED_COPY $vgpr6
  ; CHECK-NEXT:   [[PRED_COPY7:%[0-9]+]]:_(s32) = PRED_COPY $vgpr7
  ; CHECK-NEXT:   [[MV2:%[0-9]+]]:_(s64) = G_MERGE_VALUES [[PRED_COPY4]](s32), [[PRED_COPY5]](s32)
  ; CHECK-NEXT:   [[MV3:%[0-9]+]]:_(s64) = G_MERGE_VALUES [[PRED_COPY6]](s32), [[PRED_COPY7]](s32)
  ; CHECK-NEXT:   [[BUILD_VECTOR1:%[0-9]+]]:_(<2 x s64>) = G_BUILD_VECTOR [[MV2]](s64), [[MV3]](s64)
  ; CHECK-NEXT:   [[C:%[0-9]+]]:_(s64) = G_CONSTANT i64 1
  ; CHECK-NEXT:   [[C1:%[0-9]+]]:_(s64) = G_CONSTANT i64 2
  ; CHECK-NEXT:   [[BUILD_VECTOR2:%[0-9]+]]:_(<2 x s64>) = G_BUILD_VECTOR [[C]](s64), [[C1]](s64)
  ; CHECK-NEXT:   [[C2:%[0-9]+]]:_(s64) = G_CONSTANT i64 4
  ; CHECK-NEXT:   [[BUILD_VECTOR3:%[0-9]+]]:_(<2 x s64>) = G_BUILD_VECTOR [[C2]](s64), [[C2]](s64)
  ; CHECK-NEXT:   [[C3:%[0-9]+]]:_(s64) = G_CONSTANT i64 8
  ; CHECK-NEXT:   [[BUILD_VECTOR4:%[0-9]+]]:_(<2 x s64>) = G_BUILD_VECTOR [[C2]](s64), [[C3]](s64)
  ; CHECK-NEXT:   [[PTR_ADD:%[0-9]+]]:_(<2 x p1>) = G_PTR_ADD [[BUILD_VECTOR]], [[BUILD_VECTOR4]](<2 x s64>)
  ; CHECK-NEXT:   [[PRED_COPY8:%[0-9]+]]:_(<2 x p1>) = PRED_COPY [[PTR_ADD]](<2 x p1>)
  ; CHECK-NEXT:   [[UV:%[0-9]+]]:_(s32), [[UV1:%[0-9]+]]:_(s32), [[UV2:%[0-9]+]]:_(s32), [[UV3:%[0-9]+]]:_(s32) = G_UNMERGE_VALUES [[PRED_COPY8]](<2 x p1>)
  ; CHECK-NEXT:   $vgpr0 = PRED_COPY [[UV]](s32)
  ; CHECK-NEXT:   $vgpr1 = PRED_COPY [[UV1]](s32)
  ; CHECK-NEXT:   $vgpr2 = PRED_COPY [[UV2]](s32)
  ; CHECK-NEXT:   $vgpr3 = PRED_COPY [[UV3]](s32)
  ; CHECK-NEXT:   SI_RETURN implicit $vgpr0, implicit $vgpr1, implicit $vgpr2, implicit $vgpr3
  %gep = getelementptr i32, <2 x ptr addrspace(1)> %ptr, <2 x i64> <i64 1, i64 2>
  ret <2 x ptr addrspace(1)> %gep
}
