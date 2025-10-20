import * as carteModel from "../Models/carteModel.js"

export const getAllCartes = async (req , res) => {
    try {
        const allCartes = await carteModel.getAllCartes();
        res.status(200).json(allCartes);
    } catch (error) {
        console.error(error);
    }
}

export const getCarteById = async (req , res) => {

    const id = req.params.id;

    try {
        
        const carteById = await carteModel.getCarteById(id);
        res.status(200).json(carteById);
        
    } catch (error) {
        console.error(error);
    };
}

export const addCarte = async (req,res) => {

    const {nom, 
        description, 
        typeId, 
        attributId, 
        niveau, 
        attaque, 
        defense, 
        rareteId, 
        imageUrl, 
        editionCode} = req.body;

    try {
        const carte = await carteModel.addCarte(nom, description, typeId, attributId, niveau, attaque, defense, rareteId, imageUrl, editionCode);
        res.status(201).json({message: "carte crée", carte});
    } catch (error) {
        console.error(error);
    }
}