import * as utilisateurController from '../Controllers/utilisateurController.js';
// importation du module express
import express from "express";
// création du routeur qui permet de définir et de gérer des routes
const router = express.Router();
// définition de la route pour récupérer tous les utilisateurs
router.get('/allUtilisateurs', utilisateurController.getUtilisateurs);
// définition de la route pour récupérer les informations des utilisateurs
router.get('/infoUtilisateur', utilisateurController.getInfoUtilisateur);
// définition de la route pour récupérer un utilisateur par son ID (requete avec paramètre)
router.get('/utilisateurById/:id', utilisateurController.getUtilisateurById);
router.post('/addUtilisateur', utilisateurController.addUtilisateur);

export default router;