import connexion from "../config/bdd.js";

// Récupère tous les decks d'un utilisateur par son id
export const getDecksByUserId = async (userId) => {
  const query = `SELECT deck.idDeck, deck.nom, deck.description
                  FROM deck
                  WHERE deck.utilisateurId = ?`;
  const [rows] = await connexion.query(query, [userId]);
  return rows;
};