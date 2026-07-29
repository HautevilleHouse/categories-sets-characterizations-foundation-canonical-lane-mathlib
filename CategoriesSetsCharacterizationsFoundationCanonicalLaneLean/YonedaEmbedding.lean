import HautevilleHouse.CategoriesSetsCharacterizationsFoundationCanonicalLaneLean.NaturalTransformation

namespace HautevilleHouse
namespace CategoriesSetsCharacterizationsFoundationCanonicalLaneLean

structure YonedaEmbedding (C : CategoryObject) where
  embedding : SetFunctor C (CategoryObject.mk (Type u) (λ x => λ y => y) (λ B C A f g => g ∘ f) (by intro A B f; rfl) (by intro A B f; rfl) (by intro A B C D f g h; rfl))
  fullyFaithful : ∀ (A B : C.carrier), (A → B) ≃ (embedding.objectMap A → embedding.objectMap B)

structure YonedaEmbeddingEvidence (C : CategoryObject) (Y : YonedaEmbedding C) where
  fullyFaithfulClosed : Y.fullyFaithful

def YonedaEmbeddingClosed (C : CategoryObject) (Y : YonedaEmbedding C) : Prop :=
  Y.fullyFaithful

theorem yoneda_embedding_closed_from_evidence (C : CategoryObject) (Y : YonedaEmbedding C) (E : YonedaEmbeddingEvidence C Y) : YonedaEmbeddingClosed C Y := by
  exact E.fullyFaithfulClosed

end CategoriesSetsCharacterizationsFoundationCanonicalLaneLean
end HautevilleHouse
