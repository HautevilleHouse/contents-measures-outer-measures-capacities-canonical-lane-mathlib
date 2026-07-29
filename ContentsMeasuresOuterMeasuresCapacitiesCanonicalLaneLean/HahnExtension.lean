import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.OuterMeasureConstruction
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.CaratheodoryMeasurable

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure HahnExtensionPackage {X : Type u} (pre : OuterMeasurePackage X) where
  extendedOuterMeasure : OuterMeasurePackage X
  extensionMeasurable : CaratheodoryMeasurablePackage extendedOuterMeasure
  uniqueness : Prop

structure HahnExtensionEvidence {X : Type u} {pre : OuterMeasurePackage X} (H : HahnExtensionPackage pre) where
  extensionMeasurableClosed : OuterMeasureClosed H.extendedOuterMeasure
  uniquenessClosed : H.uniqueness

def HahnExtensionClosed {X : Type u} {pre : OuterMeasurePackage X} (H : HahnExtensionPackage pre) : Prop :=
  OuterMeasureClosed H.extendedOuterMeasure ∧ H.uniqueness

theorem hahn_extension_closed_from_evidence {X : Type u} {pre : OuterMeasurePackage X} (H : HahnExtensionPackage pre) (E : HahnExtensionEvidence H) : HahnExtensionClosed H := by
  exact And.intro E.extensionMeasurableClosed E.uniquenessClosed

end HautevilleHouse
end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean