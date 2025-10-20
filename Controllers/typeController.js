import * as typeModel from '../Models/typeModel.js';

export const addType = async (req, res) => {
    try {
        const { libelle } = req.body;
        const result = await typeModel.addType(libelle);
        res.status(201).json({ message: "Type ajouté avec succès", result });
    } catch (error) {
        res.status(500).json({ message: "Erreur lors de l'ajout du type", error });
    }
};
