import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure FoundationAxiomPackage where
  universe : Type u
  regularityCondition : Prop
  epsilonInduction : Prop
  noInfiniteDescendingChain : Prop

structure FoundationAxiomEvidence (F : FoundationAxiomPackage) where
  regularityConditionClosed : F.regularityCondition
  epsilonInductionClosed : F.epsilonInduction
  noInfiniteDescendingChainClosed : F.noInfiniteDescendingChain

def FoundationAxiomClosed (F : FoundationAxiomPackage) : Prop :=
  F.regularityCondition ∧ F.epsilonInduction ∧ F.noInfiniteDescendingChain

theorem foundation_axiom_closed_from_evidence (F : FoundationAxiomPackage) (E : FoundationAxiomEvidence F) :
    FoundationAxiomClosed F := by
  exact And.intro E.regularityConditionClosed (And.intro E.epsilonInductionClosed E.noInfiniteDescendingChainClosed)

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse