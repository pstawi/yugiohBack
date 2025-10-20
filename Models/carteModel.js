import connexion from "../config/bdd.js";

export const getAllCartes = async () => {
    const selectAllCartes = `
    SELECT rareteCarte.libelle as rarete, edition.nom, attributCarte.libelle as attribut, typeCarte.libelle as type FROM carte
    INNER JOIN rareteCarte ON carte.rareteId = rareteCarte.idRarete
    INNER JOIN edition ON carte.editionCode = edition.codeEdition
    INNER JOIN attributCarte ON carte.attributId = attributCarte.idAttribut
    INNER JOIN typeCarte ON carte.typeId = typeCarte.idType;
    `;

    const [result] = await connexion.query(selectAllCartes);
    return result;
}

export const getCarteById = async (id) => {
    const selectCarteById = `
    SELECT carte.nom, carte.description, rareteCarte.libelle as rarete, edition.nom, attributCarte.libelle as attribut, typeCarte.libelle as type FROM carte
    INNER JOIN rareteCarte ON carte.rareteId = rareteCarte.idRarete
    INNER JOIN edition ON carte.editionCode = edition.codeEdition
    INNER JOIN attributCarte ON carte.attributId = attributCarte.idAttribut
    INNER JOIN typeCarte ON carte.typeId = typeCarte.idType
    WHERE carte.idCarte = ?;
    `;

    const [result] = await connexion.query(selectCarteById, [id]);
    return result;
}


export const addCarte = async (nom, description, typeId, attributId, niveau, attaque, defense, rareteId, imageUrl, editionCode) => {
    const insertCarte = `
    INSERT INTO carte(nom, description, typeId, attributId, niveau, attaque, defense, rareteId, imageUrl, editionCode)
    VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
    `;

    const [result] = await connexion.query(insertCarte, [nom, description, typeId, attributId, niveau, attaque, defense, rareteId, imageUrl, editionCode])
    return result;
    
}