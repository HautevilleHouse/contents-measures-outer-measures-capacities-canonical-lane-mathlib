import canonicalLaneMathlib.AdmissibleClass
import ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.CapacityPackage

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure ChoquetCapacityPackage (C : CapacityPackage) where
  alternatingOfInfiniteOrder : Prop
  stronglySubadditive : Prop
  capacity : Set C.space → ℝ≥0∞ := C.capacity
  choquetIntegralDefined : Prop

structure ChoquetCapacityEvidence {C : CapacityPackage} (Ch : ChoquetCapacityPackage C) where
  alternatingClosed : Ch.alternatingOfInfiniteOrder
  stronglySubadditiveClosed : Ch.stronglySubadditive
  choquetIntegralDefinedClosed : Ch.choquetIntegralDefined

def ChoquetCapacityClosed {C : CapacityPackage} (Ch : ChoquetCapacityPackage C) : Prop :=
  Ch.alternatingOfInfiniteOrder ∧ Ch.stronglySubadditive ∧ Ch.choquetIntegralDefined

theorem choquet_capacity_closed_from_evidence {C : CapacityPackage} (Ch : ChoquetCapacityPackage C) (E : ChoquetCapacityEvidence Ch) :
    ChoquetCapacityClosed Ch := by
  exact And.intro E.alternatingClosed (And.intro E.stronglySubadditiveClosed E.choquetIntegralDefinedClosed)

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse