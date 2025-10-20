import express from "express";
import * as deckController from "../Controllers/deckController.js";

const router = express.Router();

// Route pour récupérer les decks d'un utilisateur
router.get("/decks/:userId", deckController.getDecks);

export default router;