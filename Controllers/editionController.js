import * as editionModel from '../models/editionModel.js';

export const addEdition = async (req, res) => {
    try {
        const { codeEdition, nom, dateSortie, fabriquant } = req.body;
        const result = await editionModel.addEdition(codeEdition, nom, dateSortie, fabriquant);
        res.status(201).json({ message: "Édition ajoutée avec succès", data: result });
    } catch (error) {
        res.status(500).json({ message: "Erreur lors de l'ajout de l'édition", error });
    }
};
