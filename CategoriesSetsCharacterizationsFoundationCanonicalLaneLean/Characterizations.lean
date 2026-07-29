import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean.CategoryOfSets

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure CharacterizationsPackage {S : SetTheoreticFoundationPackage} {C : CategoryOfSetsPackage S} where
  functorDefinition : Prop
  naturalTransformation : Prop
  limitsPreserved : Prop
  adjointnessCondition : Prop

structure CharacterizationsEvidence {S : SetTheoreticFoundationPackage} {C : CategoryOfSetsPackage S} (Ch : CharacterizationsPackage S C) where
  functorDefinitionClosed : Ch.functorDefinition
  naturalTransformationClosed : Ch.naturalTransformation
  limitsPreservedClosed : Ch.limitsPreserved
  adjointnessConditionClosed : Ch.adjointnessCondition

def CharacterizationsClosed {S : SetTheoreticFoundationPackage} {C : CategoryOfSetsPackage S} (Ch : CharacterizationsPackage S C) : Prop :=
  Ch.functorDefinition ∧ Ch.naturalTransformation ∧ Ch.limitsPreserved ∧ Ch.adjointnessCondition

theorem characterizations_closed_from_evidence {S : SetTheoreticFoundationPackage} {C : CategoryOfSetsPackage S} (Ch : CharacterizationsPackage S C) (E : CharacterizationsEvidence Ch) : CharacterizationsClosed Ch := by
  exact And.intro E.functorDefinitionClosed (And.intro E.naturalTransformationClosed (And.intro E.limitsPreservedClosed E.adjointnessConditionClosed))

end HautevilleHouse
end HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean