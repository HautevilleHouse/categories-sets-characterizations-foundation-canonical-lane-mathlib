import HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean.YonedaEmbedding

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure AdjointFunctors (C D : CategoryObject) (F : SetFunctor C D) (G : SetFunctor D C) where
  unit : NaturalTransformation C C (SetFunctor.id C) (SetFunctor.comp G F)
  counit : NaturalTransformation D D (SetFunctor.comp F G) (SetFunctor.id D)
  triangleIdentityLeft : ∀ (A : C.carrier), F.morphismMap A (G.objectMap (F.objectMap A)) (unit.component A) ∘ counit.component (F.objectMap A) = F.identityMorphism (F.objectMap A)
  triangleIdentityRight : ∀ (B : D.carrier), G.morphismMap (F.objectMap (G.objectMap B)) B (counit.component B) ∘ unit.component (G.objectMap B) = G.identityMorphism (G.objectMap B)

structure AdjointFunctorsEvidence {C D : CategoryObject} {F : SetFunctor C D} {G : SetFunctor D C} (A : AdjointFunctors C D F G) where
  triangleIdentityLeftClosed : A.triangleIdentityLeft
  triangleIdentityRightClosed : A.triangleIdentityRight

def AdjointFunctorsClosed {C D : CategoryObject} {F : SetFunctor C D} {G : SetFunctor D C} (A : AdjointFunctors C D F G) : Prop :=
  A.triangleIdentityLeft ∧ A.triangleIdentityRight

theorem adjoint_functors_closed_from_evidence {C D : CategoryObject} {F : SetFunctor C D} {G : SetFunctor D C} (A : AdjointFunctors C D F G) (E : AdjointFunctorsEvidence A) : AdjointFunctorsClosed A := by
  exact And.intro E.triangleIdentityLeftClosed E.triangleIdentityRightClosed

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse
