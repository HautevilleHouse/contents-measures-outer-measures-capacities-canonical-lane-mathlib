import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure ChoquetIntegralPackage where
  space : Type u
  capacity : Set space → ℝ≥0∞
  measurableFunctions : Type v
  choquetIntegral : measurableFunctions → ℝ≥0∞
  integralOfIndicator : ∀ A, choquetIntegral (indicator A) = capacity A
  integralMonotone : ∀ f g, (∀ x, f x ≤ g x) → choquetIntegral f ≤ choquetIntegral g
  integralPositiveHomogeneous : ∀ f c, choquetIntegral (c • f) = c * choquetIntegral f

structure ChoquetIntegralEvidence (C : ChoquetIntegralPackage) where
  integralOfIndicatorClosed : C.integralOfIndicator
  integralMonotoneClosed : C.integralMonotone
  integralPositiveHomogeneousClosed : C.integralPositiveHomogeneous

def ChoquetIntegralClosed (C : ChoquetIntegralPackage) : Prop :=
  C.integralOfIndicator ∧ C.integralMonotone ∧ C.integralPositiveHomogeneous

theorem choquet_integral_closed_from_evidence (C : ChoquetIntegralPackage) (E : ChoquetIntegralEvidence C) : ChoquetIntegralClosed C :=
  And.intro E.integralOfIndicatorClosed (And.intro E.integralMonotoneClosed E.integralPositiveHomogeneousClosed)

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse
