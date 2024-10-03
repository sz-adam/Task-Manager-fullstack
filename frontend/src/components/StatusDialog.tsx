import {
    Dialog,
    DialogContent,
    DialogContentText,
    DialogTitle,
    RadioGroup,
    FormControlLabel,
    Radio,
    Button,
} from "@mui/material";
import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchStatuses, updateStatus } from "../redux/StatusSlicer";
import { AppDispatch, RootState } from "../redux/store";
import { fetchTask } from "../redux/TaskSlicer";

interface StatusDialogProps {
    open: boolean;
    handleClose: () => void;
    taskId: string;
}

const StatusDialog: React.FC<StatusDialogProps> = ({ open, handleClose, taskId }) => {
    const dispatch = useDispatch<AppDispatch>();
    const [selectedStatus, setSelectedStatus] = useState<string | null>(null);

    const statusOptions = useSelector((state: RootState) => state.status.statusOptions);
    const loading = useSelector((state: RootState) => state.status.loading);
    const error = useSelector((state: RootState) => state.status.error);

    useEffect(() => {
        const fetchStatusData = async () => {
            await dispatch(fetchStatuses());
        };

        if (open) {
            fetchStatusData();
        }
    }, [dispatch, open]);

    const handleStatusChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        setSelectedStatus(event.target.value);
    };

    const handleUpdateStatus = async () => {
        if (selectedStatus) {
            await dispatch(updateStatus({ id: taskId, status: selectedStatus }));
            await dispatch(fetchTask())
            handleClose();
        }
    };

    return (
        <Dialog open={open} onClose={handleClose}>
            <DialogTitle>Edit Status</DialogTitle>
            <DialogContent>
                <DialogContentText>
                    Change your task status.
                </DialogContentText>

                {loading && <p>Loading...</p>}
                {error && <p>Error: {error}</p>}

                <RadioGroup value={selectedStatus} onChange={handleStatusChange}>
                    {statusOptions.map((status, index) => (
                        <FormControlLabel
                            key={index}
                            value={status}
                            control={<Radio />}
                            label={status}
                        />
                    ))}
                </RadioGroup>

                <Button onClick={handleUpdateStatus} color="primary" disabled={!selectedStatus}>
                    Update Status
                </Button>
            </DialogContent>
        </Dialog>
    );
};

export default StatusDialog;
