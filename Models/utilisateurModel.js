import connexion from "../config/bdd.js";

// fonction pour récupérer tous les utilisateurs
export const getAllUtilisateurs = async () => {
    // requête SQL pour sélectionner tous les utilisateurs
    const selectAllUtilisateurs = "SELECT * FROM utilisateur;";
    // exécution de la requête et récupération de la réponse
    const [response] = await connexion.query(selectAllUtilisateurs);
    // retour de la réponse
    return response;
};

export const getInfoUtilisateur = async () => {
    const selectInfoUtilisateur = "SELECT nom, prenom, libelle FROM utilisateur INNER JOIN roleUtilisateur ON utilisateur.roleId = roleUtilisateur.idRole;";
    const [response] = await connexion.query(selectInfoUtilisateur);
    return response;
};

// fonction pour récupérer un utilisateur par son ID, passé en paramètre
export const getUtilisateurById = async (id) => {
    // requête SQL préparée pour sélectionner un utilisateur par son ID
    const selectUtilisateurById = `
    SELECT nom, prenom, email, pseudo 
    FROM utilisateur 
    WHERE idUtilisateur = ?;`;
    // exécution de la requête avec l'ID en paramètre et récupération de la réponse
    const [response] = await connexion.query(selectUtilisateurById, [id]);
    // retour de la réponse
    return response;
};

export const addUtilisateur = async (nom, prenom, email, motDePasse, pseudo) => {
    const insertUtilisateur = `
    INSERT INTO utilisateur (nom, prenom, email, motDePasse, pseudo, dateInscription, roleId)
    VALUES (?,?,?,?,?,now(),3);
    `
    const [result] = await connexion.query(insertUtilisateur,[nom, prenom, email, motDePasse, pseudo]);

    return result;
};