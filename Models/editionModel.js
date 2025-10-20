import connexion from "../config/bdd.js";

export const addEdition = async (codeEdition, nom, dateSortie, fabriquant) => {
    const query = `
    INSERT INTO edition (codeEdition, nom, dateSortie, fabriquant)
    VALUES (?, ?, ?, ?)`;
    const [result] = await connexion.query(query, [codeEdition, nom, dateSortie, fabriquant]);
    return result;
};
