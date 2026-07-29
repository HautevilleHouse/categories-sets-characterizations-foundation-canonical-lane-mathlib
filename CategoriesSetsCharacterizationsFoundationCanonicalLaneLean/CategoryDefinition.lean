import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure CategoryDefinitionPackage where
  objectType : Type u
  morphismType : Type v
  sourceMap : morphismType → objectType
  targetMap : morphismType → objectType
  identityMap : objectType → morphismType
  compositionMap : morphismType → morphismType → morphismType
  associativityCondition : Prop
  identityCondition : Prop

structure CategoryDefinitionEvidence (C : CategoryDefinitionPackage) where
  associativityConditionClosed : C.associativityCondition
  identityConditionClosed : C.identityCondition

def CategoryDefinitionClosed (C : CategoryDefinitionPackage) : Prop :=
  C.associativityCondition ∧ C.identityCondition

theorem category_definition_closed_from_evidence (C : CategoryDefinitionPackage) (E : CategoryDefinitionEvidence C) :
    CategoryDefinitionClosed C := by
  exact And.intro E.associativityConditionClosed E.identityConditionClosed

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse