import { Request, Response } from "express";
import db from "../db/database";


const statusOptions = ["pending", "in-progress", "completed"];


export const allStatus = (req: Request, res: Response) => {
    res.json(statusOptions);
};

export const statusUpdate = (req: Request, res: Response) => {
    const { id } = req.params;
    const { status } = req.body;
    const validStatuses = ["pending", "completed", "in-progress"];

    // Ellenőrizzük, hogy érvényes-e a státusz
    if (!validStatuses.includes(status)) {
        res.status(400).json({ message: "Invalid status value" });
    }

    // Adatbázis frissítési utasítás
    const updateStatus = db.prepare("UPDATE tasks SET status = ? WHERE id = ?");

    const result = updateStatus.run(status, Number(id));

    // Ellenőrizzük, hogy történt-e változtatás az adatbázisban
    if (result.changes > 0) {
        // Sikeres frissítés
        res.status(200).json({
            message: "Status updated successfully",
            updatedStatus: status,
            taskId: id
        });
    } else {
        // Ha nem sikerült a frissítés
        res.status(404).json({
            message: "Status could not be updated"
        });
    }
};