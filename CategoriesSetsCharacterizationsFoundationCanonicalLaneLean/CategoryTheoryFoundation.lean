import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure CategoryPackage where
  objectType : Type u
  morphismType : objectType → objectType → Type v
  identityMorphism : (X : objectType) → morphismType X X
  composition : {X Y Z : objectType} → morphismType X Y → morphismType Y Z → morphismType X Z
  identityLeft : ∀ {X Y : objectType} (f : morphismType X Y), composition (identityMorphism X) f = f
  identityRight : ∀ {X Y : objectType} (f : morphismType X Y), composition f (identityMorphism Y) = f
  associativity : ∀ {W X Y Z : objectType} (f : morphismType W X) (g : morphismType X Y) (h : morphismType Y Z),
    composition (composition f g) h = composition f (composition g h)

structure CategoryEvidence (C : CategoryPackage) where
  identityLeftClosed : C.identityLeft
  identityRightClosed : C.identityRight
  associativityClosed : C.associativity

def CategoryClosed (C : CategoryPackage) : Prop :=
  C.identityLeft ∧ C.identityRight ∧ C.associativity

theorem category_closed_from_evidence (C : CategoryPackage) (E : CategoryEvidence C) : CategoryClosed C := by
  exact And.intro E.identityLeftClosed (And.intro E.identityRightClosed E.associativityClosed)

end HautevilleHouse
end HautevilleHouse