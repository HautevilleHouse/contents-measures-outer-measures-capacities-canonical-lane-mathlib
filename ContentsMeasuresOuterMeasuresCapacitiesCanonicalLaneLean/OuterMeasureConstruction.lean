import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure OuterMeasurePackage where
  space : Type u
  outerMeasure : Set space → ℝ≥0∞
  outerMeasureEmpty : outerMeasure ∅ = 0
  outerMeasureMonotone : ∀ s t, s ⊆ t → outerMeasure s ≤ outerMeasure t
  outerMeasureCountablySubadditive : ∀ (f : ℕ → Set space), outerMeasure (⋃ n, f n) ≤ ∑' n, outerMeasure (f n)

structure OuterMeasureEvidence (M : OuterMeasurePackage) where
  outerMeasureEmptyClosed : M.outerMeasureEmpty
  outerMeasureMonotoneClosed : M.outerMeasureMonotone
  outerMeasureCountablySubadditiveClosed : M.outerMeasureCountablySubadditive

def OuterMeasureClosed (M : OuterMeasurePackage) : Prop :=
  M.outerMeasureEmpty ∧ M.outerMeasureMonotone ∧ M.outerMeasureCountablySubadditive

theorem outer_measure_closed_from_evidence (M : OuterMeasurePackage) (E : OuterMeasureEvidence M) : OuterMeasureClosed M :=
  And.intro E.outerMeasureEmptyClosed (And.intro E.outerMeasureMonotoneClosed E.outerMeasureCountablySubadditiveClosed)

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse
