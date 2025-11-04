import connexion from "../config/bdd.js";

export const addAttribut = async (attributName) => {
    const query = `
    INSERT INTO attributcarte (libelleAttribut)
    VALUES (?)`;
    const [result] = await connexion.query(query, [attributName]);
    return result;
};
