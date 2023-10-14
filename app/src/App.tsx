import React from 'react';
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { PengelolaanSampahPage } from './pages/PengelolaanSampah';



function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<PengelolaanSampahPage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;