import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure CapacityPackage (X : Type u) where
  cap : Set X → ℝ≥0∞
  cap_empty : cap ∅ = 0
  cap_mono : ∀ A B, A ⊆ B → cap A ≤ cap B
  cap_subadditive : ∀ (A : ℕ → Set X), cap (⋃ i, A i) ≤ ∑' i, cap (A i)
  cap_outerRegular : ∀ A, cap A = ⨅ (U : Set X), (U ⊇ A ∧ IsOpen U) → cap U

structure CapacityEvidence {X : Type u} (P : CapacityPackage X) where
  cap_empty_closed : P.cap_empty
  cap_mono_closed : P.cap_mono
  cap_subadditive_closed : P.cap_subadditive
  cap_outerRegular_closed : P.cap_outerRegular

def CapacityClosed {X : Type u} (P : CapacityPackage X) : Prop :=
  P.cap_empty ∧ P.cap_mono ∧ P.cap_subadditive ∧ P.cap_outerRegular

theorem capacity_closed_from_evidence {X : Type u} (P : CapacityPackage X) (E : CapacityEvidence P) : CapacityClosed P := by
  exact And.intro E.cap_empty_closed (And.intro E.cap_mono_closed (And.intro E.cap_subadditive_closed E.cap_outerRegular_closed))

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse