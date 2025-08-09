import React, { useEffect, useState } from 'react';
import { getHealth } from './api';

function App() {
  const [backendStatus, setBackendStatus] = useState('Checking...');

  useEffect(() => {
    getHealth()
      .then((data) => setBackendStatus(`Backend: ${data.status}`))
      .catch((err) => setBackendStatus(`Backend error: ${err.message}`));
  }, []);

  return (
    <div className="min-h-screen bg-gray-100 p-8">
      <h1 className="text-3xl font-bold text-blue-600 mb-4">AI File Manager</h1>
      <p className="text-gray-700">Welcome to the AI File Manager application</p>
      <p className="mt-4 text-sm text-gray-500">{backendStatus}</p>
    </div>
  );
}

export default App;
