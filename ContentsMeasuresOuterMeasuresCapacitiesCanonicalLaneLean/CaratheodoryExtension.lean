import canonicalLaneMathlib.AdmissibleClass
import ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.ContentMeasuresPackage
import ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.OuterMeasurePackage

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure CaratheodoryExtensionPackage (C : ContentMeasurePackage) where
  inducedOuterMeasure : OuterMeasurePackage
  extensionAgreesOnSemiring : Prop
  caratheodoryMeasurableSets : Set (Set C.space)
  sigmaAlgebraGenerated : Set (Set C.space)
  measureOnSigmaAlgebra : Set C.space → ℝ≥0∞
  extensionIsMeasure : Prop

structure CaratheodoryExtensionEvidence {C : ContentMeasurePackage} (E : CaratheodoryExtensionPackage C) where
  extensionAgreesOnSemiringClosed : E.extensionAgreesOnSemiring
  extensionIsMeasureClosed : E.extensionIsMeasure

def CaratheodoryExtensionClosed {C : ContentMeasurePackage} (E : CaratheodoryExtensionPackage C) : Prop :=
  E.extensionAgreesOnSemiring ∧ E.extensionIsMeasure

theorem caratheodory_extension_closed_from_evidence {C : ContentMeasurePackage} (E : CaratheodoryExtensionPackage C) (Ev : CaratheodoryExtensionEvidence E) :
    CaratheodoryExtensionClosed E := by
  exact And.intro Ev.extensionAgreesOnSemiringClosed Ev.extensionIsMeasureClosed

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse