; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-apple-darwin -mcpu=knl -mattr=+avx512cd | FileCheck %s

define <16 x i32> @test_lzcnt_d(<16 x i32> %a) {
; CHECK-LABEL: test_lzcnt_d:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vplzcntd %zmm0, %zmm0
; CHECK-NEXT:    retq
  %res = call <16 x i32> @llvm.x86.avx512.mask.lzcnt.d.512(<16 x i32> %a, <16 x i32> zeroinitializer, i16 -1)
  ret <16 x i32> %res
}

declare <16 x i32> @llvm.x86.avx512.mask.lzcnt.d.512(<16 x i32>, <16 x i32>, i16) nounwind readonly

define <8 x i64> @test_lzcnt_q(<8 x i64> %a) {
; CHECK-LABEL: test_lzcnt_q:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vplzcntq %zmm0, %zmm0
; CHECK-NEXT:    retq
  %res = call <8 x i64> @llvm.x86.avx512.mask.lzcnt.q.512(<8 x i64> %a, <8 x i64> zeroinitializer, i8 -1)
  ret <8 x i64> %res
}

declare <8 x i64> @llvm.x86.avx512.mask.lzcnt.q.512(<8 x i64>, <8 x i64>, i8) nounwind readonly


define <16 x i32> @test_mask_lzcnt_d(<16 x i32> %a, <16 x i32> %b, i16 %mask) {
; CHECK-LABEL: test_mask_lzcnt_d:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovw %edi, %k1
; CHECK-NEXT:    vplzcntd %zmm0, %zmm1 {%k1}
; CHECK-NEXT:    vmovdqa64 %zmm1, %zmm0
; CHECK-NEXT:    retq
  %res = call <16 x i32> @llvm.x86.avx512.mask.lzcnt.d.512(<16 x i32> %a, <16 x i32> %b, i16 %mask)
  ret <16 x i32> %res
}

define <8 x i64> @test_mask_lzcnt_q(<8 x i64> %a, <8 x i64> %b, i8 %mask) {
; CHECK-LABEL: test_mask_lzcnt_q:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovw %edi, %k1
; CHECK-NEXT:    vplzcntq %zmm0, %zmm1 {%k1}
; CHECK-NEXT:    vmovdqa64 %zmm1, %zmm0
; CHECK-NEXT:    retq
  %res = call <8 x i64> @llvm.x86.avx512.mask.lzcnt.q.512(<8 x i64> %a, <8 x i64> %b, i8 %mask)
  ret <8 x i64> %res
}
