import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.OuterMeasureDefinition

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure CarathéodoryExtensionPackage {X : Type u} (P : OuterMeasurePackage X) where
  sigmaAlgebra : Set (Set X)
  measureOnSigmaAlgebra : sigmaAlgebra → ℝ≥0∞
  extendsOuterMeasure : ∀ A, measureOnSigmaAlgebra A = P.mu A
  isMeasure : Prop

structure CarathéodoryExtensionEvidence {X : Type u} {P : OuterMeasurePackage X} (C : CarathéodoryExtensionPackage P) where
  extendsOuterMeasureClosed : C.extendsOuterMeasure
  isMeasureClosed : C.isMeasure

def CarathéodoryExtensionClosed {X : Type u} {P : OuterMeasurePackage X} (C : CarathéodoryExtensionPackage P) : Prop :=
  C.extendsOuterMeasure ∧ C.isMeasure

theorem carathéodory_extension_closed_from_evidence {X : Type u} {P : OuterMeasurePackage X} (C : CarathéodoryExtensionPackage P) (E : CarathéodoryExtensionEvidence C) : CarathéodoryExtensionClosed C := by
  exact And.intro E.extendsOuterMeasureClosed E.isMeasureClosed

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse