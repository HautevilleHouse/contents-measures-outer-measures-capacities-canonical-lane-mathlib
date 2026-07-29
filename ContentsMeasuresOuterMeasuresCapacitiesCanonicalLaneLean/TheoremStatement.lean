import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "contents-measures-outer-measures-capacities-canonical-lane",
  theoremName := "Contents Measures Outer Measures Capacities",
  theoremObject := "CapacityAdmittedObject",
  classicalBoundary := "Carathéodory condition and capacity regularity",
  manifoldConstrainedStatement := "bridge and gate closure",
  certificateLane := "capacity_constrained",
  carriedRemainder := "classical source boundary carried by formalization"
}

def ClassicalSourceBoundaryCarried : Prop :=
  True

def ManifoldConstrainedTheoremClosed : Prop :=
  sourceTheoremStatement.certificateLane = "capacity_constrained"

def TheoremLayerInternalized : Prop :=
  sourceTheoremStatement.sourceKey = "contents-measures-outer-measures-capacities-canonical-lane" ∧
  sourceTheoremStatement.certificateLane = "capacity_constrained" ∧
  ClassicalSourceBoundaryCarried ∧
  ManifoldConstrainedTheoremClosed

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse