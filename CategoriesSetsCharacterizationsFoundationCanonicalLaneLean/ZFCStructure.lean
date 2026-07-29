import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure ZFCPackage where
  sets : Type u
  membership : sets → sets → Prop
  extensionalityAxiom : Prop
  foundationAxiom : Prop
  replacementScheme : Prop
  axiomsConsistent : Prop

structure ZFCEvidence (Z : ZFCPackage) where
  extensionalityAxiomClosed : Z.extensionalityAxiom
  foundationAxiomClosed : Z.foundationAxiom
  replacementSchemeClosed : Z.replacementScheme
  axiomsConsistentClosed : Z.axiomsConsistent

def ZFCClosed (Z : ZFCPackage) : Prop :=
  Z.extensionalityAxiom ∧ Z.foundationAxiom ∧ Z.replacementScheme ∧ Z.axiomsConsistent

theorem zfc_closed_from_evidence (Z : ZFCPackage) (E : ZFCEvidence Z) :
    ZFCClosed Z := by
  exact And.intro E.extensionalityAxiomClosed
    (And.intro E.foundationAxiomClosed
      (And.intro E.replacementSchemeClosed E.axiomsConsistentClosed))

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse