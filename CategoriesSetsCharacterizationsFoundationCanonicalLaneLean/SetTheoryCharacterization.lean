import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure SetCharacterizationPackage where
  setOperation : Type u → Type u
  unionClosed : Prop
  intersectionClosed : Prop
  complementClosed : Prop
  setTheoryConsistent : Prop

structure SetCharacterizationEvidence (S : SetCharacterizationPackage) where
  unionClosedClosed : S.unionClosed
  intersectionClosedClosed : S.intersectionClosed
  complementClosedClosed : S.complementClosed
  setTheoryConsistentClosed : S.setTheoryConsistent

def SetCharacterizationClosed (S : SetCharacterizationPackage) : Prop :=
  S.unionClosed ∧ S.intersectionClosed ∧ S.complementClosed ∧ S.setTheoryConsistent

theorem set_characterization_closed_from_evidence (S : SetCharacterizationPackage) (E : SetCharacterizationEvidence S) :
    SetCharacterizationClosed S := by
  exact And.intro E.unionClosedClosed
    (And.intro E.intersectionClosedClosed
      (And.intro E.complementClosedClosed E.setTheoryConsistentClosed))

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse