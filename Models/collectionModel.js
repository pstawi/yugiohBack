import connexion from "../config/bdd.js";

export const getCollectionsByUserId = async (userId) => {
    const query = `
    SELECT collection.idCollection, collection.nom, collection.description               
    FROM collection                
    WHERE collection.utilisateurId = ?`;
    const [rows] = await connexion.query(query, [userId]);

  return rows;
};