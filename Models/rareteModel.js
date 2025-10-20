import connexion from "../config/bdd.js";

export const addRarete = async (rareteName) => {
    const query = `
    INSERT INTO rarete (libelle)
    VALUES (?)`;
    const [result] = await connexion.query(query, [rareteName]);
    return result;
};
