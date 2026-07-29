import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | AdmittedObject.mk space μ cap compat =>
    ∀ A', μ.mu A' = capacity.cap A'

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  rcases A.object with ⟨space, μ, cap, compat⟩
  intro A'
  exact compat A'

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse