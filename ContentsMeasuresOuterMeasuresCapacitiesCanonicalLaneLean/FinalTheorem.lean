import canonicalLaneMathlib.AdmissibleClass
import ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.BridgeLemmas
import ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

def ConstrainedCapacityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_capacity_endgame (A : AdmissibleClass) :
    ConstrainedCapacityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse