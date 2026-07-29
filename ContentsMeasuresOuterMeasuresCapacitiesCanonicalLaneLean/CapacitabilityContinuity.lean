import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.CapacityPackage

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure CapacitabilityContinuityPackage {X : Type u} (C : CapacityPackage X) where
  capacitability : ∀ A, C.cap A = ⨅ (K : Set X), (K ⊆ A ∧ IsCompact K) → C.cap K
  continuityFromBelow : ∀ (A : ℕ → Set X), (∀ i, A i ⊆ A (i+1)) → C.cap (⋃ i, A i) = ⨆ i, C.cap (A i)
  continuityFromAbove : ∀ (A : ℕ → Set X), (∀ i, A (i+1) ⊆ A i) ∧ (C.cap (A 0) < ∞) → C.cap (⋂ i, A i) = ⨅ i, C.cap (A i)

structure CapacitabilityContinuityEvidence {X : Type u} {C : CapacityPackage X} (P : CapacitabilityContinuityPackage C) where
  capacitability_closed : P.capacitability
  continuityFromBelow_closed : P.continuityFromBelow
  continuityFromAbove_closed : P.continuityFromAbove

def CapacitabilityContinuityClosed {X : Type u} {C : CapacityPackage X} (P : CapacitabilityContinuityPackage C) : Prop :=
  P.capacitability ∧ P.continuityFromBelow ∧ P.continuityFromAbove

theorem capacitability_continuity_closed_from_evidence {X : Type u} {C : CapacityPackage X} (P : CapacitabilityContinuityPackage C) (E : CapacitabilityContinuityEvidence P) : CapacitabilityContinuityClosed P := by
  exact And.intro E.capacitability_closed (And.intro E.continuityFromBelow_closed E.continuityFromAbove_closed)

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse