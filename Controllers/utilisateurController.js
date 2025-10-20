import * as utilisateurModel from '../Models/utilisateurModel.js';
// importation de bcrypt pour le hachage des mots de passe
import bcrypt from 'bcryptjs';

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

export const addUtilisateur = async (req,res) => {

    // récupération des données du corps de la requête
    const {nom, prenom, email, motDePasse, pseudo} = req.body;

    try {

        // hachage du mot de passe avant de le stocker
        const mdpHash = bcrypt.hashSync(motDePasse, 10);
// appel du modèle pour ajouter l'utilisateur avec le mot de passe haché
        const utilisateur = await utilisateurModel.addUtilisateur(nom, prenom, email, mdpHash, pseudo);
        res.status(201).json({message: "utilisateur créé", utilisateur});
    } catch (error) {
        console.error(error);
    }
};