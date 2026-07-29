import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure CapacityPackage where
  space : Type u
  capacity : Set space → ℝ
  monotone : ∀ A B, A ⊆ B → capacity A ≤ capacity B
  subadditive : ∀ A B, capacity (A ∪ B) ≤ capacity A + capacity B
  empty_zero : capacity ∅ = 0
  outerRegular : ∀ A, capacity A = ⨅ {U : Set space | A ⊆ U ∧ IsOpen U}, capacity U

structure CapacityEvidence (C : CapacityPackage) where
  monotoneClosed : C.monotone
  subadditiveClosed : C.subadditive
  emptyZeroClosed : C.empty_zero
  outerRegularClosed : C.outerRegular

def CapacityClosed (C : CapacityPackage) : Prop :=
  C.monotone ∧ C.subadditive ∧ C.empty_zero ∧ C.outerRegular

theorem capacity_closed_from_evidence (C : CapacityPackage)
    (E : CapacityEvidence C) : CapacityClosed C := by
  exact And.intro E.monotoneClosed (And.intro E.subadditiveClosed (And.intro E.emptyZeroClosed E.outerRegularClosed))

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse