import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure OuterMeasurePackage where
  space : Type u
  outerMeasure : Set space → ℝ≥0∞
  empty_zero : outerMeasure ∅ = 0
  monotone : ∀ A B, A ⊆ B → outerMeasure A ≤ outerMeasure B
  countableSubadditive : ∀ (f : ℕ → Set space), outerMeasure (⋃ n, f n) ≤ ∑' n, outerMeasure (f n)

structure OuterMeasureEvidence (O : OuterMeasurePackage) where
  emptyZeroClosed : O.empty_zero
  monotoneClosed : O.monotone
  countableSubadditiveClosed : O.countableSubadditive

def OuterMeasureClosed (O : OuterMeasurePackage) : Prop :=
  O.empty_zero ∧ O.monotone ∧ O.countableSubadditive

theorem outer_measure_closed_from_evidence (O : OuterMeasurePackage)
    (E : OuterMeasureEvidence O) : OuterMeasureClosed O := by
  exact And.intro E.emptyZeroClosed (And.intro E.monotoneClosed E.countableSubadditiveClosed)

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse