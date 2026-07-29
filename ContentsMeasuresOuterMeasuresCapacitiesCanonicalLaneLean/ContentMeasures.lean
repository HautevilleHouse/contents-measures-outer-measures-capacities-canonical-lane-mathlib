import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure ContentMeasurePackage where
  space : Type u
  sigmaAlgebra : Set (Set space)
  content : Set space → ℝ
  monotone : ∀ A B, A ⊆ B → content A ≤ content B
  subadditive : ∀ A B, content (A ∪ B) ≤ content A + content B
  empty_zero : content ∅ = 0

structure ContentMeasureEvidence (C : ContentMeasurePackage) where
  monotoneClosed : C.monotone
  subadditiveClosed : C.subadditive
  emptyZeroClosed : C.empty_zero

def ContentMeasureClosed (C : ContentMeasurePackage) : Prop :=
  C.monotone ∧ C.subadditive ∧ C.empty_zero

theorem content_measure_closed_from_evidence (C : ContentMeasurePackage)
    (E : ContentMeasureEvidence C) : ContentMeasureClosed C := by
  exact And.intro E.monotoneClosed (And.intro E.subadditiveClosed E.emptyZeroClosed)

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse