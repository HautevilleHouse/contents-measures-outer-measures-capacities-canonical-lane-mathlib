import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure ContentMeasurePackage where
  space : Type u
  sigmaAlgebra : Set (Set space)
  content : (Set space) → ℝ≥0∞
  monotone : Prop
  subadditive : Prop
  contentDefinedOnSemiring : Prop

structure ContentMeasureEvidence (C : ContentMeasurePackage) where
  monotoneClosed : C.monotone
  subadditiveClosed : C.subadditive
  contentDefinedOnSemiringClosed : C.contentDefinedOnSemiring

def ContentMeasureClosed (C : ContentMeasurePackage) : Prop :=
  C.monotone ∧ C.subadditive ∧ C.contentDefinedOnSemiring

theorem content_measure_closed_from_evidence (C : ContentMeasurePackage) (E : ContentMeasureEvidence C) :
    ContentMeasureClosed C := by
  exact And.intro E.monotoneClosed (And.intro E.subadditiveClosed E.contentDefinedOnSemiringClosed)

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse