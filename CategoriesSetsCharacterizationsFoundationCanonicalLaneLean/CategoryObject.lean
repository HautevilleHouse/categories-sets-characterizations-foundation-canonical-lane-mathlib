import HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure CategoryObject where
  carrier : Type u
  identityMorphism : carrier → carrier
  composition : (B C : carrier) → (A : carrier) → (f : A → B) → (g : B → C) → (A → C)
  identityLawLeft : ∀ (A B : carrier) (f : A → B), composition A B A f (identityMorphism A) = f
  identityLawRight : ∀ (A B : carrier) (f : A → B), composition A B B (identityMorphism B) f = f
  associativityLaw : ∀ (A B C D : carrier) (f : A → B) (g : B → C) (h : C → D), composition A C D (composition A B C f g) h = composition A B D f (composition B C D g h)

structure CategoryObjectEvidence (C : CategoryObject) where
  identityLawLeftClosed : C.identityLawLeft
  identityLawRightClosed : C.identityLawRight
  associativityLawClosed : C.associativityLaw

def CategoryObjectClosed (C : CategoryObject) : Prop :=
  C.identityLawLeft ∧ C.identityLawRight ∧ C.associativityLaw

theorem category_object_closed_from_evidence (C : CategoryObject) (E : CategoryObjectEvidence C) : CategoryObjectClosed C := by
  exact And.intro E.identityLawLeftClosed (And.intro E.identityLawRightClosed E.associativityLawClosed)

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse
