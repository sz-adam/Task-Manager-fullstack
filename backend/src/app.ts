import express from "express";
import bodyParser from "body-parser";
import taskRouter from "./routes/TaskRoute";

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use("/api", taskRouter);


app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
