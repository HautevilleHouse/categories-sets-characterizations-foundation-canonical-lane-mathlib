import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.GateLemmas

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse