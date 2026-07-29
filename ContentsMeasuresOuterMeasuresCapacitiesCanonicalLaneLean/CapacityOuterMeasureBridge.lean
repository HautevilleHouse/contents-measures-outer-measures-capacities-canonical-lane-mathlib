import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.CapacityDefinition
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.OuterMeasureConstruction

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure CapacityOuterMeasureBridge (X : Type u) where
  cap : CapacityPackage X
  outer : OuterMeasurePackage X
  bridgeCondition : ∀ A, cap.cap A = outer.mu A

def bridgeClosed {X : Type u} (B : CapacityOuterMeasureBridge X) : Prop :=
  B.bridgeCondition

theorem bridge_from_bridge {X : Type u} (B : CapacityOuterMeasureBridge X) : bridgeClosed B := by
  exact B.bridgeCondition

end HautevilleHouse
end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean