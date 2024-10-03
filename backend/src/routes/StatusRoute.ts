import { Router } from 'express';
import { allStatus, statusUpdate, } from '../controllers/StatusController';


const router = Router();

// Státuszok lekérése
router.get('/allstatus', allStatus);
//http://localhost:3000/api/updatestatus/id
router.put("/updatestatus/:id", statusUpdate);

export default router;
