import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean.SetTheoreticFoundation

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure CategoryOfSetsPackage {S : SetTheoreticFoundationPackage} where
  objectCollection : S.categorySet -> Prop
  morphismCollection : S.categorySet -> S.categorySet -> Prop
  identityMorphism : S.categorySet -> (S.categorySet -> S.categorySet) -> Prop
  compositionOperation : Prop

structure CategoryOfSetsEvidence {S : SetTheoreticFoundationPackage} (C : CategoryOfSetsPackage S) where
  objectCollectionClosed : C.objectCollection
  morphismCollectionClosed : C.morphismCollection
  identityMorphismClosed : C.identityMorphism
  compositionOperationClosed : C.compositionOperation

def CategoryOfSetsClosed {S : SetTheoreticFoundationPackage} (C : CategoryOfSetsPackage S) : Prop :=
  C.objectCollection ∧ C.morphismCollection ∧ C.identityMorphism ∧ C.compositionOperation

theorem category_of_sets_closed_from_evidence {S : SetTheoreticFoundationPackage} (C : CategoryOfSetsPackage S) (E : CategoryOfSetsEvidence C) : CategoryOfSetsClosed C := by
  exact And.intro E.objectCollectionClosed (And.intro E.morphismCollectionClosed (And.intro E.identityMorphismClosed E.compositionOperationClosed))

end HautevilleHouse
end HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean