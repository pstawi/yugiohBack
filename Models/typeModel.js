import connexion from "../config/bdd.js";

export const addType = async (libelle) => {
    const query = `
    INSERT INTO typeCarte (libelle)
    VALUES (?)`;
    const [result] = await connexion.query(query, [libelle]);
    return result;
};