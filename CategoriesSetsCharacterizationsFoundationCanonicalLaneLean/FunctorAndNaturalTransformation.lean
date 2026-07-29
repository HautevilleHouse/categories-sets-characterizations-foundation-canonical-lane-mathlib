import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean.CategoryTheoryFoundation

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure FunctorPackage (C D : CategoryPackage) where
  objectMap : C.objectType → D.objectType
  morphismMap : {X Y : C.objectType} → C.morphismType X Y → D.morphismType (objectMap X) (objectMap Y)
  preservesIdentity : ∀ (X : C.objectType), morphismMap (C.identityMorphism X) = D.identityMorphism (objectMap X)
  preservesComposition : ∀ {X Y Z : C.objectType} (f : C.morphismType X Y) (g : C.morphismType Y Z),
    morphismMap (C.composition f g) = D.composition (morphismMap f) (morphismMap g)

structure FunctorEvidence {C D : CategoryPackage} (F : FunctorPackage C D) where
  preservesIdentityClosed : F.preservesIdentity
  preservesCompositionClosed : F.preservesComposition

def FunctorClosed {C D : CategoryPackage} (F : FunctorPackage C D) : Prop :=
  F.preservesIdentity ∧ F.preservesComposition

theorem functor_closed_from_evidence {C D : CategoryPackage} (F : FunctorPackage C D) (E : FunctorEvidence F) : FunctorClosed F := by
  exact And.intro E.preservesIdentityClosed E.preservesCompositionClosed

structure NaturalTransformationPackage {C D : CategoryPackage} (F G : FunctorPackage C D) where
  component : (X : C.objectType) → D.morphismType (F.objectMap X) (G.objectMap X)
  naturality : ∀ {X Y : C.objectType} (f : C.morphismType X Y),
    D.composition (component X) (G.morphismMap f) = D.composition (F.morphismMap f) (component Y)

structure NaturalTransformationEvidence {C D : CategoryPackage} {F G : FunctorPackage C D} (N : NaturalTransformationPackage F G) where
  naturalityClosed : N.naturality

def NaturalTransformationClosed {C D : CategoryPackage} {F G : FunctorPackage C D} (N : NaturalTransformationPackage F G) : Prop :=
  N.naturality

theorem natural_transformation_closed_from_evidence {C D : CategoryPackage} {F G : FunctorPackage C D}
  (N : NaturalTransformationPackage F G) (E : NaturalTransformationEvidence N) : NaturalTransformationClosed N := by
  exact E.naturalityClosed

end HautevilleHouse
end HautevilleHouse