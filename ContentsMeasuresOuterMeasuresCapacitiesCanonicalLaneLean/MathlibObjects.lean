import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MeasureSpace where
  carrier : Type
  sigmaAlgebra : Set (Set carrier)

structure OuterMeasure where
  space : MeasureSpace
  mu : Set (Set (space.carrier)) → ℝ≥0∞
  muEmpty : mu ∅ = 0
  muMonotone : ∀ A B, A ⊆ B → mu A ≤ mu B
  muCountablySubadditive : ∀ (f : ℕ → Set (space.carrier)), mu (⋃ i, f i) ≤ ∑' i, mu (f i)

structure Capacity where
  space : MeasureSpace
  cap : Set (Set (space.carrier)) → ℝ≥0∞
  capEmpty : cap ∅ = 0
  capMonotone : ∀ A B, A ⊆ B → cap A ≤ cap B
  capCountablySubadditive : ∀ (f : ℕ → Set (space.carrier)), cap (⋃ i, f i) ≤ ∑' i, cap (f i)
  capIncreasing : ∀ A, cap A = ⨆ (K : Set (space.carrier)) (_ : K ⊆ A) (_ : IsCompact K), cap K

structure AdmittedObject where
  space : MeasureSpace
  outerMeasure : OuterMeasure space
  capacity : Capacity space
  compatibility : ∀ A, outerMeasure.mu A ≤ capacity.cap A

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse