import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure OuterMeasurePackage (X : Type u) where
  mu : Set X → ℝ≥0∞
  mu_empty : mu ∅ = 0
  mu_mono : ∀ A B, A ⊆ B → mu A ≤ mu B
  mu_subadditive : ∀ (A : ℕ → Set X), mu (⋃ i, A i) ≤ ∑' i, mu (A i)

structure OuterMeasureEvidence {X : Type u} (P : OuterMeasurePackage X) where
  mu_empty_closed : P.mu_empty
  mu_mono_closed : P.mu_mono
  mu_subadditive_closed : P.mu_subadditive

def OuterMeasureClosed {X : Type u} (P : OuterMeasurePackage X) : Prop :=
  P.mu_empty ∧ P.mu_mono ∧ P.mu_subadditive

theorem outer_measure_closed_from_evidence {X : Type u} (P : OuterMeasurePackage X) (E : OuterMeasureEvidence P) : OuterMeasureClosed P := by
  exact And.intro E.mu_empty_closed (And.intro E.mu_mono_closed E.mu_subadditive_closed)

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse