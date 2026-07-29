import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure CapacityPackage where
  space : Type u
  capacity : Set space → ℝ≥0∞
  capacityEmpty : capacity ∅ = 0
  capacityMonotone : ∀ s t, s ⊆ t → capacity s ≤ capacity t
  capacityCountablySubadditive : ∀ (f : ℕ → Set space), capacity (⋃ n, f n) ≤ ∑' n, capacity (f n)
  capacityStronglySubadditive : ∀ s t, capacity (s ∪ t) + capacity (s ∩ t) ≤ capacity s + capacity t

structure CapacityEvidence (C : CapacityPackage) where
  capacityEmptyClosed : C.capacityEmpty
  capacityMonotoneClosed : C.capacityMonotone
  capacityCountablySubadditiveClosed : C.capacityCountablySubadditive
  capacityStronglySubadditiveClosed : C.capacityStronglySubadditive

def CapacityClosed (C : CapacityPackage) : Prop :=
  C.capacityEmpty ∧ C.capacityMonotone ∧ C.capacityCountablySubadditive ∧ C.capacityStronglySubadditive

theorem capacity_closed_from_evidence (C : CapacityPackage) (E : CapacityEvidence C) : CapacityClosed C :=
  And.intro E.capacityEmptyClosed (And.intro E.capacityMonotoneClosed (And.intro E.capacityCountablySubadditiveClosed E.capacityStronglySubadditiveClosed))

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse
