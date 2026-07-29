import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.OuterMeasureDefinition
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.CapacityPackage

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure ChoiceOfOuterMeasuresPackage {X : Type u} (C : CapacityPackage X) where
  outerMeasureFamily : Set (OuterMeasurePackage X)
  capacityFromOuterMeasure : OuterMeasurePackage X → CapacityPackage X
  consistency : ∀ μ ∈ outerMeasureFamily, capacityFromOuterMeasure μ = C

structure ChoiceOfOuterMeasuresEvidence {X : Type u} {C : CapacityPackage X} (P : ChoiceOfOuterMeasuresPackage C) where
  consistency_closed : P.consistency

def ChoiceOfOuterMeasuresClosed {X : Type u} {C : CapacityPackage X} (P : ChoiceOfOuterMeasuresPackage C) : Prop :=
  P.consistency

theorem choice_of_outer_measures_closed_from_evidence {X : Type u} {C : CapacityPackage X} (P : ChoiceOfOuterMeasuresPackage C) (E : ChoiceOfOuterMeasuresEvidence P) : ChoiceOfOuterMeasuresClosed P := by
  exact E.consistency_closed

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse