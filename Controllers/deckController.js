import * as deckModel from "../Models/deckModel.js";

export const getDecks = async (req, res) => {
  try {
    const { userId } = req.params;
    const decks = await deckModel.getDecksByUserId(userId);
    console.log("Le deck a été récupéré avec succès ✅");
    res.status(200).json(decks);
  } catch (error) {
    console.error("Erreur lors de la récupération des decks :", error);
    res.status(500).json({ message: "Erreur serveur" });
  }
};