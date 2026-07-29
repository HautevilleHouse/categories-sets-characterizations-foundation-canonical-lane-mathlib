import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure SetCategoryPackage where
  objects : Type 1
  arrows : objects → objects → Type 1
  identity : (X : objects) → arrows X X
  composition : {X Y Z : objects} → arrows Y Z → arrows X Y → arrows X Z
  identityLeft : ∀ {X Y : objects} (f : arrows X Y), composition (identity Y) f = f
  identityRight : ∀ {X Y : objects} (f : arrows X Y), composition f (identity X) = f
  associativity : ∀ {X Y Z W : objects} (h : arrows Z W) (g : arrows Y Z) (f : arrows X Y),
    composition h (composition g f) = composition (composition h g) f

structure SetCategoryEvidence (C : SetCategoryPackage) where
  identityLeftClosed : C.identityLeft
  identityRightClosed : C.identityRight
  associativityClosed : C.associativity

def SetCategoryClosed (C : SetCategoryPackage) : Prop :=
  C.identityLeft ∧ C.identityRight ∧ C.associativity

theorem set_category_closed_from_evidence (C : SetCategoryPackage) (E : SetCategoryEvidence C) : SetCategoryClosed C :=
  And.intro E.identityLeftClosed (And.intro E.identityRightClosed E.associativityClosed)

structure SetTheoreticFoundationPackage (C : SetCategoryPackage) where
  membershipType : C.objects → C.objects → Prop
  extensionalityAxiom : ∀ (X Y : C.objects), (∀ (z : C.objects), membershipType z X ↔ membershipType z Y) → X = Y
  pairingAxiom : ∀ (X Y : C.objects), ∃ (Z : C.objects), ∀ (z : C.objects), membershipType z Z ↔ (z = X ∨ z = Y)
  unionAxiom : ∀ (X : C.objects), ∃ (Z : C.objects), ∀ (z : C.objects), membershipType z Z ↔ ∃ (Y : C.objects), membershipType z Y ∧ membershipType Y X
  powerSetAxiom : ∀ (X : C.objects), ∃ (Z : C.objects), ∀ (z : C.objects), membershipType z Z ↔ ∀ (y : C.objects), membershipType y z → membershipType y X

structure SetTheoreticFoundationEvidence {C : SetCategoryPackage} (F : SetTheoreticFoundationPackage C) where
  extensionalityAxiomClosed : F.extensionalityAxiom
  pairingAxiomClosed : F.pairingAxiom
  unionAxiomClosed : F.unionAxiom
  powerSetAxiomClosed : F.powerSetAxiom

def SetTheoreticFoundationClosed {C : SetCategoryPackage} (F : SetTheoreticFoundationPackage C) : Prop :=
  F.extensionalityAxiom ∧ F.pairingAxiom ∧ F.unionAxiom ∧ F.powerSetAxiom

theorem set_theoretic_foundation_closed_from_evidence {C : SetCategoryPackage}
    (F : SetTheoreticFoundationPackage C) (E : SetTheoreticFoundationEvidence F) :
    SetTheoreticFoundationClosed F :=
  And.intro E.extensionalityAxiomClosed (And.intro E.pairingAxiomClosed (And.intro E.unionAxiomClosed E.powerSetAxiomClosed))

structure CategoryOfSetsCharacterization {C : SetCategoryPackage} (F : SetTheoreticFoundationPackage C) where
  objectsAreSets : ∀ (X : C.objects), SetTheoreticFoundationClosed F → (∀ (z : C.objects), F.membershipType z X → SetTheoreticFoundationClosed F)
  arrowsAreFunctions : ∀ (X Y : C.objects) (f : C.arrows X Y), Prop
  limitsAndColimitsExist : Prop

structure CategoryOfSetsCharacterizationEvidence {C : SetCategoryPackage} {F : SetTheoreticFoundationPackage C}
    (Char : CategoryOfSetsCharacterization F) where
  objectsAreSetsClosed : Char.objectsAreSets
  arrowsAreFunctionsClosed : ∀ (X Y : C.objects) (f : C.arrows X Y), Char.arrowsAreFunctions X Y f
  limitsAndColimitsExistClosed : Char.limitsAndColimitsExist

def CategoryOfSetsCharacterizationClosed {C : SetCategoryPackage} {F : SetTheoreticFoundationPackage C}
    (Char : CategoryOfSetsCharacterization F) : Prop :=
  Char.objectsAreSets ∧ (∀ (X Y : C.objects) (f : C.arrows X Y), Char.arrowsAreFunctions X Y f) ∧ Char.limitsAndColimitsExist

theorem category_of_sets_characterization_closed_from_evidence
    {C : SetCategoryPackage} {F : SetTheoreticFoundationPackage C}
    (Char : CategoryOfSetsCharacterization F) (E : CategoryOfSetsCharacterizationEvidence Char) :
    CategoryOfSetsCharacterizationClosed Char :=
  And.intro E.objectsAreSetsClosed (And.intro (fun X Y f => E.arrowsAreFunctionsClosed X Y f) E.limitsAndColimitsExistClosed)

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse