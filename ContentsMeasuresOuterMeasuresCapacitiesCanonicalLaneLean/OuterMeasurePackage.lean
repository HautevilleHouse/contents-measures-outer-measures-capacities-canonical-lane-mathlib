import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure OuterMeasurePackage where
  space : Type u
  outerMeasure : Set space → ℝ≥0∞
  emptyZero : outerMeasure ∅ = 0
  monotone : ∀ s t, s ⊆ t → outerMeasure s ≤ outerMeasure t
  countableSubadditive : ∀ (f : ℕ → Set space), outerMeasure (⋃ i, f i) ≤ ∑' i, outerMeasure (f i)

def OuterMeasureClosed (O : OuterMeasurePackage) : Prop :=
  O.emptyZero ∧ O.monotone ∧ O.countableSubadditive

theorem outer_measure_empty_zero (O : OuterMeasurePackage) : O.outerMeasure ∅ = 0 := O.emptyZero
theorem outer_measure_monotone (O : OuterMeasurePackage) (s t : Set O.space) (h : s ⊆ t) : O.outerMeasure s ≤ O.outerMeasure t := O.monotone s t h
theorem outer_measure_countable_subadditive (O : OuterMeasurePackage) (f : ℕ → Set O.space) : O.outerMeasure (⋃ i, f i) ≤ ∑' i, O.outerMeasure (f i) := O.countableSubadditive f

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse