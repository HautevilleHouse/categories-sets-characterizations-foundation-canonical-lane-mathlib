import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure FunctorDefinitionPackage where
  sourceCategory : CategoryDefinitionPackage
  targetCategory : CategoryDefinitionPackage
  objectFunction : sourceCategory.objectType → targetCategory.objectType
  morphismFunction : sourceCategory.morphismType → targetCategory.morphismType
  compositionPreserved : Prop
  identityPreserved : Prop

structure FunctorDefinitionEvidence (F : FunctorDefinitionPackage) where
  compositionPreservedClosed : F.compositionPreserved
  identityPreservedClosed : F.identityPreserved

def FunctorDefinitionClosed (F : FunctorDefinitionPackage) : Prop :=
  F.compositionPreserved ∧ F.identityPreserved

theorem functor_definition_closed_from_evidence (F : FunctorDefinitionPackage) (E : FunctorDefinitionEvidence F) :
    FunctorDefinitionClosed F := by
  exact And.intro E.compositionPreservedClosed E.identityPreservedClosed

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse