import HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean.CategoryObject

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure SetFunctor (C D : CategoryObject) where
  objectMap : C.carrier → D.carrier
  morphismMap : ∀ (A B : C.carrier), (A → B) → (objectMap A → objectMap B)
  identityPreservation : ∀ (A : C.carrier), morphismMap A A (C.identityMorphism A) = D.identityMorphism (objectMap A)
  compositionPreservation : ∀ (A B C' : C.carrier) (f : A → B) (g : B → C'), morphismMap A C' (C.composition A B C' f g) = D.composition (objectMap A) (objectMap B) (objectMap C') (morphismMap A B f) (morphismMap B C' g)

structure SetFunctorEvidence {C D : CategoryObject} (F : SetFunctor C D) where
  identityPreservationClosed : F.identityPreservation
  compositionPreservationClosed : F.compositionPreservation

def SetFunctorClosed {C D : CategoryObject} (F : SetFunctor C D) : Prop :=
  F.identityPreservation ∧ F.compositionPreservation

theorem set_functor_closed_from_evidence {C D : CategoryObject} (F : SetFunctor C D) (E : SetFunctorEvidence F) : SetFunctorClosed F := by
  exact And.intro E.identityPreservationClosed E.compositionPreservationClosed

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse
