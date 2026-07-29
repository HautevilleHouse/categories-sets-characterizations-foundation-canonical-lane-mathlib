import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean.CategoryTheoryFoundation
import HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean.FunctorAndNaturalTransformation

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure ConePackage {C : CategoryPackage} {J : CategoryPackage} (D : FunctorPackage J C) (X : C.objectType) where
  apex : X
  projection : (j : J.objectType) → C.morphismType X (D.objectMap j)
  commuting : ∀ {i j : J.objectType} (f : J.morphismType i j),
    C.composition (projection i) (D.morphismMap f) = projection j

structure ConeEvidence {C : CategoryPackage} {J : CategoryPackage} {D : FunctorPackage J C} {X : C.objectType} (Cn : ConePackage D X) where
  commutingClosed : Cn.commuting

def ConeClosed {C : CategoryPackage} {J : CategoryPackage} {D : FunctorPackage J C} {X : C.objectType} (Cn : ConePackage D X) : Prop :=
  Cn.commuting

theorem cone_closed_from_evidence {C : CategoryPackage} {J : CategoryPackage} {D : FunctorPackage J C} {X : C.objectType}
  (Cn : ConePackage D X) (E : ConeEvidence Cn) : ConeClosed Cn := by
  exact E.commutingClosed

structure LimitPackage {C : CategoryPackage} {J : CategoryPackage} (D : FunctorPackage J C) where
  coneObject : C.objectType
  cone : ConePackage D coneObject
  universalProperty : ∀ (X : C.objectType) (Cn : ConePackage D X), ∃! (u : C.morphismType X coneObject),
    ∀ (j : J.objectType), C.composition u (cone.projection j) = Cn.projection j

structure LimitEvidence {C : CategoryPackage} {J : CategoryPackage} {D : FunctorPackage J C} (L : LimitPackage D) where
  universalPropertyClosed : L.universalProperty

def LimitClosed {C : CategoryPackage} {J : CategoryPackage} {D : FunctorPackage J C} (L : LimitPackage D) : Prop :=
  L.universalProperty

theorem limit_closed_from_evidence {C : CategoryPackage} {J : CategoryPackage} {D : FunctorPackage J C}
  (L : LimitPackage D) (E : LimitEvidence L) : LimitClosed L := by
  exact E.universalPropertyClosed

structure ColimitPackage {C : CategoryPackage} {J : CategoryPackage} (D : FunctorPackage J C) where
  coconeObject : C.objectType
  cocone : ConePackage (FunctorPackage.mk (λ j : J.objectType => D.objectMap j) (λ f => D.morphismMap f) (by
      intro j; rw [D.preservesIdentity]) (by
      intro i j k f g; rw [D.preservesComposition])) coconeObject
  universalProperty : ∀ (X : C.objectType) (Co : ConePackage (FunctorPackage.mk (λ j : J.objectType => D.objectMap j) (λ f => D.morphismMap f) (by
      intro j; rw [D.preservesIdentity]) (by
      intro i j k f g; rw [D.preservesComposition])) X), ∃! (u : C.morphismType coconeObject X),
    ∀ (j : J.objectType), C.composition (cocone.projection j) u = Co.projection j

structure ColimitEvidence {C : CategoryPackage} {J : CategoryPackage} {D : FunctorPackage J C} (Col : ColimitPackage D) where
  universalPropertyClosed : Col.universalProperty

def ColimitClosed {C : CategoryPackage} {J : CategoryPackage} {D : FunctorPackage J C} (Col : ColimitPackage D) : Prop :=
  Col.universalProperty

theorem colimit_closed_from_evidence {C : CategoryPackage} {J : CategoryPackage} {D : FunctorPackage J C}
  (Col : ColimitPackage D) (E : ColimitEvidence Col) : ColimitClosed Col := by
  exact E.universalPropertyClosed

end HautevilleHouse
end HautevilleHouse