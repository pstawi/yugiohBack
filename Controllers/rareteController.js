import * as rareteModel from '../models/rareteModel.js';

export const addRarete = async (req, res) => {
    try {
        const { libelle } = req.body;
        const result = await rareteModel.addRarete(libelle);
        res.status(201).json({ message: "Rareté ajoutée avec succès", data: result });
    } catch (error) {
        res.status(500).json({ message: "Erreur lors de l'ajout de la rareté", error });
    }
};
