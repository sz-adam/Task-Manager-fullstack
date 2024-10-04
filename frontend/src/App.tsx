import './App.css'
import Header from './components/Header'
import Tasks from './components/Tasks'
import { ThemeProvider, createTheme } from '@mui/material/styles';
import CssBaseline from '@mui/material/CssBaseline';


const darkTheme = createTheme({
  palette: {
    mode: 'dark',
    primary: {
      main: '#1976d2',
    },

  },
});

function App() {


  return (
    <>
      <ThemeProvider theme={darkTheme}>
        <CssBaseline />
        <Header />
        <Tasks />
      </ThemeProvider>
    </>
  )
}

export default App
