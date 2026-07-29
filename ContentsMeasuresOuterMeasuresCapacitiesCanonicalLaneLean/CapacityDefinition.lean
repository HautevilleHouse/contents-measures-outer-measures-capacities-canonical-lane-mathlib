import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure CapacityPackage (X : Type u) where
  cap : Set X → ENNReal
  monotonicity : ∀ s t, s ⊆ t → cap s ≤ cap t
  subadditive : ∀ s t, cap (s ∪ t) ≤ cap s + cap t
  outerRegular : Prop

structure CapacityEvidence (C : CapacityPackage X) where
  monotonicityClosed : C.monotonicity
  subadditiveClosed : C.subadditive
  outerRegularClosed : C.outerRegular

def CapacityClosed (C : CapacityPackage X) : Prop :=
  C.monotonicity ∧ C.subadditive ∧ C.outerRegular

theorem capacity_closed_from_evidence (C : CapacityPackage X) (E : CapacityEvidence C) : CapacityClosed C := by
  exact And.intro E.monotonicityClosed (And.intro E.subadditiveClosed E.outerRegularClosed)

end HautevilleHouse
end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean