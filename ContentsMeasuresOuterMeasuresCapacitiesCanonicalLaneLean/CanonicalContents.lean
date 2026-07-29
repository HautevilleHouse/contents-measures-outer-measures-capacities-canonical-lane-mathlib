import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean

structure ContentsPackage where
  space : Type u
  sigmaAlgebra : Set (Set space)
  content : (Set space) → ℝ≥0∞
  contentEmpty : content ∅ = 0
  contentFiniteAdditive : ∀ s t, s ∈ sigmaAlgebra → t ∈ sigmaAlgebra → s ∩ t = ∅ → content (s ∪ t) = content s + content t
  contentMonotone : ∀ s t, s ∈ sigmaAlgebra → t ∈ sigmaAlgebra → s ⊆ t → content s ≤ content t

structure ContentsEvidence (C : ContentsPackage) where
  contentEmptyClosed : C.contentEmpty
  contentFiniteAdditiveClosed : C.contentFiniteAdditive
  contentMonotoneClosed : C.contentMonotone

def ContentsClosed (C : ContentsPackage) : Prop :=
  C.contentEmpty ∧ C.contentFiniteAdditive ∧ C.contentMonotone

theorem contents_closed_from_evidence (C : ContentsPackage) (E : ContentsEvidence C) : ContentsClosed C :=
  And.intro E.contentEmptyClosed (And.intro E.contentFiniteAdditiveClosed E.contentMonotoneClosed)

end ContentsMeasuresOuterMeasuresCapacitiesCanonicalLaneLean
end HautevilleHouse
