import HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean.SetFunctor

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure NaturalTransformation (C D : CategoryObject) (F G : SetFunctor C D) where
  component : ∀ (A : C.carrier), F.objectMap A → G.objectMap A
  naturality : ∀ (A B : C.carrier) (f : A → B), G.morphismMap A B f ∘ component A = component B ∘ F.morphismMap A B f

structure NaturalTransformationEvidence {C D : CategoryObject} {F G : SetFunctor C D} (N : NaturalTransformation C D F G) where
  naturalityClosed : N.naturality

def NaturalTransformationClosed {C D : CategoryObject} {F G : SetFunctor C D} (N : NaturalTransformation C D F G) : Prop :=
  N.naturality

theorem natural_transformation_closed_from_evidence {C D : CategoryObject} {F G : SetFunctor C D} (N : NaturalTransformation C D F G) (E : NaturalTransformationEvidence N) : NaturalTransformationClosed N := by
  exact E.naturalityClosed

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse
