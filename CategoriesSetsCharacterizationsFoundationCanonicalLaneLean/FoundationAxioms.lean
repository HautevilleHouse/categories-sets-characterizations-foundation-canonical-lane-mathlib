import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean.SetTheoreticFoundation

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure FoundationAxiomsPackage {S : SetTheoreticFoundationPackage} where
  extensionality : Prop
  regularity : Prop
  replacement : Prop
  powerSet : Prop
  union : Prop
  infinity : Prop
  choice : Prop

structure FoundationAxiomsEvidence {S : SetTheoreticFoundationPackage} (F : FoundationAxiomsPackage S) where
  extensionalityClosed : F.extensionality
  regularityClosed : F.regularity
  replacementClosed : F.replacement
  powerSetClosed : F.powerSet
  unionClosed : F.union
  infinityClosed : F.infinity
  choiceClosed : F.choice

def FoundationAxiomsClosed {S : SetTheoreticFoundationPackage} (F : FoundationAxiomsPackage S) : Prop :=
  F.extensionality ∧ F.regularity ∧ F.replacement ∧ F.powerSet ∧ F.union ∧ F.infinity ∧ F.choice

theorem foundation_axioms_closed_from_evidence {S : SetTheoreticFoundationPackage} (F : FoundationAxiomsPackage S) (E : FoundationAxiomsEvidence F) : FoundationAxiomsClosed F := by
  exact And.intro E.extensionalityClosed (And.intro E.regularityClosed (And.intro E.replacementClosed (And.intro E.powerSetClosed (And.intro E.unionClosed (And.intro E.infinityClosed E.choiceClosed)))))

end HautevilleHouse
end HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean