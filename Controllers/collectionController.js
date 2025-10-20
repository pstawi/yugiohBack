import * as collectionModel from "../Models/collectionModel.js";

export const getCollections = async (req, res) => {
  try {
    const { userId } = req.params;
    const collections = await collectionModel.getCollectionsByUserId(userId);

    res.status(200).json(collections);
  } catch (error) {
    console.error("Erreur lors de la récupération des collections :", error);
    res.status(500).json({ message: "Erreur serveur" });
  }
};