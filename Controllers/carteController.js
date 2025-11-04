import * as carteModel from "../Models/carteModel.js"

export const getAllCartes = async (req , res) => {
    try {
        const { q, idType, idRarete, codeEdition, minATK, maxATK, minDEF, maxDEF, page, limit } = req.query;
        if (q || idType || idRarete || codeEdition || minATK || maxATK || minDEF || maxDEF || page || limit) {
            const result = await carteModel.searchCartes({ q, idType, idRarete, codeEdition, minATK, maxATK, minDEF, maxDEF, page, limit });
            res.status(200).json(result);
        } else {
            const allCartes = await carteModel.getAllCartes();
            res.status(200).json(allCartes);
        }
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
        idType, 
        idAttribut, 
        niveau, 
        attaque, 
        defense, 
        idRarete, 
        imageUrl, 
        codeEdition} = req.body;

    try {
        const carte = await carteModel.addCarte(nom, description, idType, idAttribut, niveau, attaque, defense, idRarete, imageUrl, codeEdition);
        res.status(201).json({message: "carte crée", carte});
    } catch (error) {
        console.error(error);
    }
}