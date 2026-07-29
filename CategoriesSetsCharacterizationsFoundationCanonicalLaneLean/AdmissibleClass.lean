import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure SetsCardObject where
  carrier : Type
  topology : TopologicalSpace carrier

structure SetsAdmittedObject where
  set : SetsCardObject
  setAxioms : Prop
  categoryStructure : Prop
  characterizationClosed : Prop
  conclusion : characterizationClosed

structure SetsEndgameState where
  object : SetsAdmittedObject

def SetsWitnessClosed (O : SetsAdmittedObject) : Prop :=
  O.characterizationClosed

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse