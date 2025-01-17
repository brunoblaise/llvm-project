; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-pc-linux -mattr=+bmi,+lzcnt | FileCheck %s

; LZCNT and TZCNT will always produce the operand size when the input operand
; is zero. This test is to verify that we efficiently select LZCNT/TZCNT
; based on the fact that the 'icmp+select' sequence is always redundant
; in every function defined below.


define i16 @test1_ctlz(i16 %v) {
; CHECK-LABEL: test1_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntw %di, %ax
; CHECK-NEXT:    retq
  %cnt = tail call i16 @llvm.ctlz.i16(i16 %v, i1 true)
  %tobool = icmp eq i16 %v, 0
  %cond = select i1 %tobool, i16 16, i16 %cnt
  ret i16 %cond
}


define i32 @test2_ctlz(i32 %v) {
; CHECK-LABEL: test2_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntl %edi, %eax
; CHECK-NEXT:    retq
  %cnt = tail call i32 @llvm.ctlz.i32(i32 %v, i1 true)
  %tobool = icmp eq i32 %v, 0
  %cond = select i1 %tobool, i32 32, i32 %cnt
  ret i32 %cond
}


define i64 @test3_ctlz(i64 %v) {
; CHECK-LABEL: test3_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntq %rdi, %rax
; CHECK-NEXT:    retq
  %cnt = tail call i64 @llvm.ctlz.i64(i64 %v, i1 true)
  %tobool = icmp eq i64 %v, 0
  %cond = select i1 %tobool, i64 64, i64 %cnt
  ret i64 %cond
}


define i16 @test4_ctlz(i16 %v) {
; CHECK-LABEL: test4_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntw %di, %ax
; CHECK-NEXT:    retq
  %cnt = tail call i16 @llvm.ctlz.i16(i16 %v, i1 true)
  %tobool = icmp eq i16 0, %v
  %cond = select i1 %tobool, i16 16, i16 %cnt
  ret i16 %cond
}


define i32 @test5_ctlz(i32 %v) {
; CHECK-LABEL: test5_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntl %edi, %eax
; CHECK-NEXT:    retq
  %cnt = tail call i32 @llvm.ctlz.i32(i32 %v, i1 true)
  %tobool = icmp eq i32 0, %v
  %cond = select i1 %tobool, i32 32, i32 %cnt
  ret i32 %cond
}


define i64 @test6_ctlz(i64 %v) {
; CHECK-LABEL: test6_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntq %rdi, %rax
; CHECK-NEXT:    retq
  %cnt = tail call i64 @llvm.ctlz.i64(i64 %v, i1 true)
  %tobool = icmp eq i64 0, %v
  %cond = select i1 %tobool, i64 64, i64 %cnt
  ret i64 %cond
}


define i16 @test10_ctlz(i16* %ptr) {
; CHECK-LABEL: test10_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntw (%rdi), %ax
; CHECK-NEXT:    retq
  %v = load i16, i16* %ptr
  %cnt = tail call i16 @llvm.ctlz.i16(i16 %v, i1 true)
  %tobool = icmp eq i16 %v, 0
  %cond = select i1 %tobool, i16 16, i16 %cnt
  ret i16 %cond
}


define i32 @test11_ctlz(i32* %ptr) {
; CHECK-LABEL: test11_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntl (%rdi), %eax
; CHECK-NEXT:    retq
  %v = load i32, i32* %ptr
  %cnt = tail call i32 @llvm.ctlz.i32(i32 %v, i1 true)
  %tobool = icmp eq i32 %v, 0
  %cond = select i1 %tobool, i32 32, i32 %cnt
  ret i32 %cond
}


define i64 @test12_ctlz(i64* %ptr) {
; CHECK-LABEL: test12_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntq (%rdi), %rax
; CHECK-NEXT:    retq
  %v = load i64, i64* %ptr
  %cnt = tail call i64 @llvm.ctlz.i64(i64 %v, i1 true)
  %tobool = icmp eq i64 %v, 0
  %cond = select i1 %tobool, i64 64, i64 %cnt
  ret i64 %cond
}


define i16 @test13_ctlz(i16* %ptr) {
; CHECK-LABEL: test13_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntw (%rdi), %ax
; CHECK-NEXT:    retq
  %v = load i16, i16* %ptr
  %cnt = tail call i16 @llvm.ctlz.i16(i16 %v, i1 true)
  %tobool = icmp eq i16 0, %v
  %cond = select i1 %tobool, i16 16, i16 %cnt
  ret i16 %cond
}


define i32 @test14_ctlz(i32* %ptr) {
; CHECK-LABEL: test14_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntl (%rdi), %eax
; CHECK-NEXT:    retq
  %v = load i32, i32* %ptr
  %cnt = tail call i32 @llvm.ctlz.i32(i32 %v, i1 true)
  %tobool = icmp eq i32 0, %v
  %cond = select i1 %tobool, i32 32, i32 %cnt
  ret i32 %cond
}


define i64 @test15_ctlz(i64* %ptr) {
; CHECK-LABEL: test15_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntq (%rdi), %rax
; CHECK-NEXT:    retq
  %v = load i64, i64* %ptr
  %cnt = tail call i64 @llvm.ctlz.i64(i64 %v, i1 true)
  %tobool = icmp eq i64 0, %v
  %cond = select i1 %tobool, i64 64, i64 %cnt
  ret i64 %cond
}


define i16 @test1_cttz(i16 %v) {
; CHECK-LABEL: test1_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    orl $65536, %edi # imm = 0x10000
; CHECK-NEXT:    tzcntl %edi, %eax
; CHECK-NEXT:    # kill: def $ax killed $ax killed $eax
; CHECK-NEXT:    retq
  %cnt = tail call i16 @llvm.cttz.i16(i16 %v, i1 true)
  %tobool = icmp eq i16 %v, 0
  %cond = select i1 %tobool, i16 16, i16 %cnt
  ret i16 %cond
}


define i32 @test2_cttz(i32 %v) {
; CHECK-LABEL: test2_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tzcntl %edi, %eax
; CHECK-NEXT:    retq
  %cnt = tail call i32 @llvm.cttz.i32(i32 %v, i1 true)
  %tobool = icmp eq i32 %v, 0
  %cond = select i1 %tobool, i32 32, i32 %cnt
  ret i32 %cond
}


define i64 @test3_cttz(i64 %v) {
; CHECK-LABEL: test3_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tzcntq %rdi, %rax
; CHECK-NEXT:    retq
  %cnt = tail call i64 @llvm.cttz.i64(i64 %v, i1 true)
  %tobool = icmp eq i64 %v, 0
  %cond = select i1 %tobool, i64 64, i64 %cnt
  ret i64 %cond
}


define i16 @test4_cttz(i16 %v) {
; CHECK-LABEL: test4_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    orl $65536, %edi # imm = 0x10000
; CHECK-NEXT:    tzcntl %edi, %eax
; CHECK-NEXT:    # kill: def $ax killed $ax killed $eax
; CHECK-NEXT:    retq
  %cnt = tail call i16 @llvm.cttz.i16(i16 %v, i1 true)
  %tobool = icmp eq i16 0, %v
  %cond = select i1 %tobool, i16 16, i16 %cnt
  ret i16 %cond
}


define i32 @test5_cttz(i32 %v) {
; CHECK-LABEL: test5_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tzcntl %edi, %eax
; CHECK-NEXT:    retq
  %cnt = tail call i32 @llvm.cttz.i32(i32 %v, i1 true)
  %tobool = icmp eq i32 0, %v
  %cond = select i1 %tobool, i32 32, i32 %cnt
  ret i32 %cond
}


define i64 @test6_cttz(i64 %v) {
; CHECK-LABEL: test6_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tzcntq %rdi, %rax
; CHECK-NEXT:    retq
  %cnt = tail call i64 @llvm.cttz.i64(i64 %v, i1 true)
  %tobool = icmp eq i64 0, %v
  %cond = select i1 %tobool, i64 64, i64 %cnt
  ret i64 %cond
}


define i16 @test10_cttz(i16* %ptr) {
; CHECK-LABEL: test10_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movzwl (%rdi), %eax
; CHECK-NEXT:    orl $65536, %eax # imm = 0x10000
; CHECK-NEXT:    tzcntl %eax, %eax
; CHECK-NEXT:    # kill: def $ax killed $ax killed $eax
; CHECK-NEXT:    retq
  %v = load i16, i16* %ptr
  %cnt = tail call i16 @llvm.cttz.i16(i16 %v, i1 true)
  %tobool = icmp eq i16 %v, 0
  %cond = select i1 %tobool, i16 16, i16 %cnt
  ret i16 %cond
}


define i32 @test11_cttz(i32* %ptr) {
; CHECK-LABEL: test11_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tzcntl (%rdi), %eax
; CHECK-NEXT:    retq
  %v = load i32, i32* %ptr
  %cnt = tail call i32 @llvm.cttz.i32(i32 %v, i1 true)
  %tobool = icmp eq i32 %v, 0
  %cond = select i1 %tobool, i32 32, i32 %cnt
  ret i32 %cond
}


define i64 @test12_cttz(i64* %ptr) {
; CHECK-LABEL: test12_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tzcntq (%rdi), %rax
; CHECK-NEXT:    retq
  %v = load i64, i64* %ptr
  %cnt = tail call i64 @llvm.cttz.i64(i64 %v, i1 true)
  %tobool = icmp eq i64 %v, 0
  %cond = select i1 %tobool, i64 64, i64 %cnt
  ret i64 %cond
}


define i16 @test13_cttz(i16* %ptr) {
; CHECK-LABEL: test13_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movzwl (%rdi), %eax
; CHECK-NEXT:    orl $65536, %eax # imm = 0x10000
; CHECK-NEXT:    tzcntl %eax, %eax
; CHECK-NEXT:    # kill: def $ax killed $ax killed $eax
; CHECK-NEXT:    retq
  %v = load i16, i16* %ptr
  %cnt = tail call i16 @llvm.cttz.i16(i16 %v, i1 true)
  %tobool = icmp eq i16 0, %v
  %cond = select i1 %tobool, i16 16, i16 %cnt
  ret i16 %cond
}


define i32 @test14_cttz(i32* %ptr) {
; CHECK-LABEL: test14_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tzcntl (%rdi), %eax
; CHECK-NEXT:    retq
  %v = load i32, i32* %ptr
  %cnt = tail call i32 @llvm.cttz.i32(i32 %v, i1 true)
  %tobool = icmp eq i32 0, %v
  %cond = select i1 %tobool, i32 32, i32 %cnt
  ret i32 %cond
}


define i64 @test15_cttz(i64* %ptr) {
; CHECK-LABEL: test15_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tzcntq (%rdi), %rax
; CHECK-NEXT:    retq
  %v = load i64, i64* %ptr
  %cnt = tail call i64 @llvm.cttz.i64(i64 %v, i1 true)
  %tobool = icmp eq i64 0, %v
  %cond = select i1 %tobool, i64 64, i64 %cnt
  ret i64 %cond
}


define i16 @test4b_ctlz(i16 %v) {
; CHECK-LABEL: test4b_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntw %di, %ax
; CHECK-NEXT:    retq
  %cnt = tail call i16 @llvm.ctlz.i16(i16 %v, i1 true)
  %tobool = icmp ne i16 %v, 0
  %cond = select i1 %tobool, i16 %cnt, i16 16
  ret i16 %cond
}


define i32 @test5b_ctlz(i32 %v) {
; CHECK-LABEL: test5b_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntl %edi, %eax
; CHECK-NEXT:    retq
  %cnt = tail call i32 @llvm.ctlz.i32(i32 %v, i1 true)
  %tobool = icmp ne i32 %v, 0
  %cond = select i1 %tobool, i32 %cnt, i32 32
  ret i32 %cond
}


define i64 @test6b_ctlz(i64 %v) {
; CHECK-LABEL: test6b_ctlz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lzcntq %rdi, %rax
; CHECK-NEXT:    retq
  %cnt = tail call i64 @llvm.ctlz.i64(i64 %v, i1 true)
  %tobool = icmp ne i64 %v, 0
  %cond = select i1 %tobool, i64 %cnt, i64 64
  ret i64 %cond
}


define i16 @test4b_cttz(i16 %v) {
; CHECK-LABEL: test4b_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    orl $65536, %edi # imm = 0x10000
; CHECK-NEXT:    tzcntl %edi, %eax
; CHECK-NEXT:    # kill: def $ax killed $ax killed $eax
; CHECK-NEXT:    retq
  %cnt = tail call i16 @llvm.cttz.i16(i16 %v, i1 true)
  %tobool = icmp ne i16 %v, 0
  %cond = select i1 %tobool, i16 %cnt, i16 16
  ret i16 %cond
}


define i32 @test5b_cttz(i32 %v) {
; CHECK-LABEL: test5b_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tzcntl %edi, %eax
; CHECK-NEXT:    retq
  %cnt = tail call i32 @llvm.cttz.i32(i32 %v, i1 true)
  %tobool = icmp ne i32 %v, 0
  %cond = select i1 %tobool, i32 %cnt, i32 32
  ret i32 %cond
}


define i64 @test6b_cttz(i64 %v) {
; CHECK-LABEL: test6b_cttz:
; CHECK:       # %bb.0:
; CHECK-NEXT:    tzcntq %rdi, %rax
; CHECK-NEXT:    retq
  %cnt = tail call i64 @llvm.cttz.i64(i64 %v, i1 true)
  %tobool = icmp ne i64 %v, 0
  %cond = select i1 %tobool, i64 %cnt, i64 64
  ret i64 %cond
}


declare i64 @llvm.cttz.i64(i64, i1)
declare i32 @llvm.cttz.i32(i32, i1)
declare i16 @llvm.cttz.i16(i16, i1)
declare i64 @llvm.ctlz.i64(i64, i1)
declare i32 @llvm.ctlz.i32(i32, i1)
declare i16 @llvm.ctlz.i16(i16, i1)

