import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean.CategoryTheoryFoundation
import HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean.FunctorAndNaturalTransformation

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure YonedaLemmaPackage (C : CategoryPackage) where
  homFunctor : FunctorPackage C (CategoryPackage.mk (C.objectType → Type u) (fun F G => ∀ (X : C.objectType), F X → G X) (fun F X x => x) (fun F G H f g X x => g X (f X x)) (by intro; rfl) (by intro; rfl) (by intro; rfl))
  yonedaNaturalIsomorphism : (A : C.objectType) (F : FunctorPackage C (CategoryPackage.mk (C.objectType → Type u) (fun F G => ∀ (X : C.objectType), F X → G X) (fun F X x => x) (fun F G H f g X x => g X (f X x)) (by intro; rfl) (by intro; rfl) (by intro; rfl)) →
    NaturalTransformationPackage (homFunctor) F → F.objectMap A
  isomorphismInverse : (A : C.objectType) (F : FunctorPackage C (CategoryPackage.mk (C.objectType → Type u) (fun F G => ∀ (X : C.objectType), F X → G X) (fun F X x => x) (fun F G H f g X x => g X (f X x)) (by intro; rfl) (by intro; rfl) (by intro; rfl)) →
    F.objectMap A → NaturalTransformationPackage (homFunctor) F
  leftInverse : (A : C.objectType) (F : FunctorPackage C (CategoryPackage.mk (C.objectType → Type u) (fun F G => ∀ (X : C.objectType), F X → G X) (fun F X x => x) (fun F G H f g X x => g X (f X x)) (by intro; rfl) (by intro; rfl) (by intro; rfl)) (x : F.objectMap A) →
    yonedaNaturalIsomorphism A F (isomorphismInverse A F x) = x
  rightInverse : (A : C.objectType) (F : FunctorPackage C (CategoryPackage.mk (C.objectType → Type u) (fun F G => ∀ (X : C.objectType), F X → G X) (fun F X x => x) (fun F G H f g X x => g X (f X x)) (by intro; rfl) (by intro; rfl) (by intro; rfl)) (η : NaturalTransformationPackage (homFunctor) F) →
    isomorphismInverse A F (yonedaNaturalIsomorphism A F η) = η

structure YonedaLemmaEvidence {C : CategoryPackage} (Y : YonedaLemmaPackage C) where
  leftInverseClosed : Y.leftInverse
  rightInverseClosed : Y.rightInverse

def YonedaLemmaClosed {C : CategoryPackage} (Y : YonedaLemmaPackage C) : Prop :=
  Y.leftInverse ∧ Y.rightInverse

theorem yoneda_lemma_closed_from_evidence {C : CategoryPackage} (Y : YonedaLemmaPackage C) (E : YonedaLemmaEvidence Y) : YonedaLemmaClosed Y := by
  exact And.intro E.leftInverseClosed E.rightInverseClosed

end HautevilleHouse
end HautevilleHouse