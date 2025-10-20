import * as attributModel from '../Models/attributModel.js';

export const addAttribut = async (req, res) => {
    try {
        const {libelle} = req.body;
        const result = await attributModel.addAttribut(libelle);
        res.status(201).json({ message: "Attribut ajouté avec succès", data: result });
    } catch (error) {
        res.status(500).json({ message: "Erreur lors de l'ajout de l'attribut", error });
    }
};
