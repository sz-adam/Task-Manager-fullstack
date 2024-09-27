import express from 'express';
import cors from 'cors';
import taskRouter from './routes/TaskRoute';

const app = express();
const port = 3000;

// Middleware beállítások
app.use(cors()); 
app.use(express.json()); 
app.use(express.urlencoded({ extended: true }));

// API route-ok
app.use('/api', taskRouter);

// szerver
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
