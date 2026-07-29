import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure HomsetsAndCompositionPackage where
  objectCollection : Type u
  morphismCollection : Type v
  homSet : objectCollection → objectCollection → Set morphismCollection
  compositionRule : (a b c : objectCollection) → homSet a b → homSet b c → homSet a c
  associativityCondition : Prop
  identityCondition : Prop

structure HomsetsAndCompositionEvidence (H : HomsetsAndCompositionPackage) where
  associativityConditionClosed : H.associativityCondition
  identityConditionClosed : H.identityCondition

def HomsetsAndCompositionClosed (H : HomsetsAndCompositionPackage) : Prop :=
  H.associativityCondition ∧ H.identityCondition

theorem homsets_and_composition_closed_from_evidence (H : HomsetsAndCompositionPackage) (E : HomsetsAndCompositionEvidence H) :
    HomsetsAndCompositionClosed H := by
  exact And.intro E.associativityConditionClosed E.identityConditionClosed

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse