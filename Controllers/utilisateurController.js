import * as utilisateurModel from '../Models/utilisateurModel.js'

// fonction pour récupérer tous les utilisateurs
export const getUtilisateurs = async (req, res) => {

    try {
        // appel du modèle pour récupérer les utilisateurs
        const utilisateurs = await utilisateurModel.getAllUtilisateurs();
        // envoi de la réponse avec les utilisateurs récupérés
        res.status(200).json(utilisateurs);
        
    } catch (error) {
        // gestion des erreurs
        console.error("une erreur est survenue", error);
        
    }
};

export const getInfoUtilisateur = async (req, res) => {
    try {
        const infoUtilisateur = await utilisateurModel.getInfoUtilisateur();
        res.status(200).json(infoUtilisateur);     
    } catch (error) {
        console.error("une erreur est survenue", error);
    }
};

export const getUtilisateurById = async (req, res) => {

    const id = req.params.id;

    try {
        const utilisateurById = await utilisateurModel.getUtilisateurById(id);
        res.status(200).json(utilisateurById);
    } catch (error) {
        console.error("une erreur est survenue", error);
    }
};