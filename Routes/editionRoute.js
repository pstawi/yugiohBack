import * as editionController from '../Controllers/editionController.js';
import express from 'express';
const router = express.Router();

router.post('/addEdition', editionController.addEdition);

export default router;