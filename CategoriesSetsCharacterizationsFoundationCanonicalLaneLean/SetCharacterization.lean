import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure SetCharacterizationPackage where
  carrier : Type u
  membershipRelation : Prop
  extensionalityAxiom : Prop
  pairingAxiom : Prop
  unionAxiom : Prop
  powerSetAxiom : Prop
  infinityAxiom : Prop
  replacementAxiom : Prop
  foundationAxiom : Prop
  choiceAxiom : Prop

structure SetCharacterizationEvidence (S : SetCharacterizationPackage) where
  membershipRelationClosed : S.membershipRelation
  extensionalityAxiomClosed : S.extensionalityAxiom
  pairingAxiomClosed : S.pairingAxiom
  unionAxiomClosed : S.unionAxiom
  powerSetAxiomClosed : S.powerSetAxiom
  infinityAxiomClosed : S.infinityAxiom
  replacementAxiomClosed : S.replacementAxiom
  foundationAxiomClosed : S.foundationAxiom
  choiceAxiomClosed : S.choiceAxiom

def SetCharacterizationClosed (S : SetCharacterizationPackage) : Prop :=
  S.membershipRelation ∧ S.extensionalityAxiom ∧ S.pairingAxiom ∧ S.unionAxiom ∧
  S.powerSetAxiom ∧ S.infinityAxiom ∧ S.replacementAxiom ∧ S.foundationAxiom ∧ S.choiceAxiom

theorem set_characterization_closed_from_evidence (S : SetCharacterizationPackage) (E : SetCharacterizationEvidence S) :
    SetCharacterizationClosed S := by
  exact And.intro E.membershipRelationClosed
    (And.intro E.extensionalityAxiomClosed
      (And.intro E.pairingAxiomClosed
        (And.intro E.unionAxiomClosed
          (And.intro E.powerSetAxiomClosed
            (And.intro E.infinityAxiomClosed
              (And.intro E.replacementAxiomClosed
                (And.intro E.foundationAxiomClosed E.choiceAxiomClosed)))))))

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse