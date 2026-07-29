import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.OuterMeasureConstruction

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure CaratheodoryMeasurablePackage {X : Type u} (O : OuterMeasurePackage X) where
  measurableSets : Set (Set X)
  measurabilityCondition : ∀ A, A ∈ measurableSets ↔ ∀ B, O.mu B = O.mu (B ∩ A) + O.mu (B \ A)
  sigmaAlgebraGenerated : Set (Set X)
  restrictionToSigmaAlgebra : Prop

structure CaratheodoryMeasurableEvidence {X : Type u} {O : OuterMeasurePackage X} (C : CaratheodoryMeasurablePackage O) where
  measurabilityConditionClosed : C.measurabilityCondition
  restrictionToSigmaAlgebraClosed : C.restrictionToSigmaAlgebra

def CaratheodoryMeasurableClosed {X : Type u} {O : OuterMeasurePackage X} (C : CaratheodoryMeasurablePackage O) : Prop :=
  C.restrictionToSigmaAlgebra

theorem caratheodory_measurable_closed_from_evidence {X : Type u} {O : OuterMeasurePackage X} (C : CaratheodoryMeasurablePackage O) (E : CaratheodoryMeasurableEvidence C) : CaratheodoryMeasurableClosed C := by
  exact E.restrictionToSigmaAlgebraClosed

end HautevilleHouse
end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean