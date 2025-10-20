import * as typeController from '../Controllers/typeController.js';
import express from 'express';
const router = express.Router();

router.post('/addType', typeController.addType);

export default router;