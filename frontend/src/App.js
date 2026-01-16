import React, { useState, useEffect } from 'react';

function App() {
    const [health, setHealth] = useState(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        fetch('/api/health')
            .then(res => res.json())
            .then(data => {
                setHealth(data);
                setLoading(false);
            })
            .catch(err => {
                console.error("Error fetching health:", err);
                setLoading(false);
            });
    }, []);

    return (
        <div style={{
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
            justifyContent: 'center',
            height: '100vh',
            textAlign: 'center'
        }}>
            <h1 style={{ fontSize: '3rem', marginBottom: '1rem', background: 'linear-gradient(to right, #60a5fa, #a855f7)', WebkitBackgroundClip: 'text', WebkitTextFillColor: 'transparent' }}>
                AWS 2-Tier App
            </h1>
            <p style={{ fontSize: '1.2rem', color: '#94a3b8' }}>Deployed on a single EC2 via PM2</p>

            <div style={{
                marginTop: '2rem',
                padding: '1.5rem',
                borderRadius: '1rem',
                background: 'rgba(30, 41, 59, 0.5)',
                border: '1px solid #334155',
                backdropFilter: 'blur(10px)',
                minWidth: '300px'
            }}>
                <h2 style={{ marginBottom: '1rem' }}>Backend Status</h2>
                {loading ? (
                    <p>Checking backend...</p>
                ) : health ? (
                    <div style={{ color: '#4ade80' }}>
                        <p style={{ fontWeight: 'bold' }}>{health.status}</p>
                        <p style={{ fontSize: '0.8rem', color: '#94a3b8' }}>Last checked: {new Date(health.timestamp).toLocaleTimeString()}</p>
                    </div>
                ) : (
                    <p style={{ color: '#f87171' }}>Backend Unreachable</p>
                )}
            </div>
        </div>
    );
}

export default App;
