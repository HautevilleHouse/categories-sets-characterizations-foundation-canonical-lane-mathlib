import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure IsomorphismFoundationPackage where
  sourceObject : Type u
  targetObject : Type u
  morphismSet : Type v
  compositionDefined : Prop
  identityExists : Prop
  invertibleCondition : Prop

structure IsomorphismFoundationEvidence (P : IsomorphismFoundationPackage) where
  compositionDefinedClosed : P.compositionDefined
  identityExistsClosed : P.identityExists
  invertibleConditionClosed : P.invertibleCondition

def IsomorphismFoundationClosed (P : IsomorphismFoundationPackage) : Prop :=
  P.compositionDefined ∧ P.identityExists ∧ P.invertibleCondition

theorem isomorphism_foundation_closed_from_evidence (P : IsomorphismFoundationPackage) (E : IsomorphismFoundationEvidence P) :
    IsomorphismFoundationClosed P := by
  exact And.intro E.compositionDefinedClosed (And.intro E.identityExistsClosed E.invertibleConditionClosed)

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse