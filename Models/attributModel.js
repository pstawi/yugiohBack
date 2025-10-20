import connexion from "../config/bdd.js";

export const addAttribut = async (attributName) => {
    const query = `
    INSERT INTO attribut (libelle)
    VALUES (?)`;
    const [result] = await connexion.query(query, [attributName]);
    return result;
};
