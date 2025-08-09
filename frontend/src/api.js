const API_BASE_URL = process.env.VITE_API_URL || 'http://localhost:8000';

export async function fetchBackend(endpoint, options = {}) {
  const response = await fetch(`${API_BASE_URL}${endpoint}`, {
    headers: {
      'Content-Type': 'application/json',
      ...options.headers,
    },
    ...options,
  });

  if (!response.ok) {
    throw new Error(`HTTP error! status: ${response.status}`);
  }
  return response.json();
}

export async function getHealth() {
  return fetchBackend('/health');
}
