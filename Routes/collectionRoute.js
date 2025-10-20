import express from "express";
import * as collectionController from "../Controllers/collectionController.js";

const router = express.Router();

// Route pour récupérer les collections d'un utilisateur
router.get("/collections/:userId", collectionController.getCollections);

export default router;