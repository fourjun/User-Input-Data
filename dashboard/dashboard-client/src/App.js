import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

function App() {
  const [records, setRecords] = useState([]);
  const [formData, setFormData] = useState({ name: '', email: '', role: 'User' });
  const [isLoading, setIsLoading] = useState(false);
  
  // New State: Tracks which ID we are currently editing (null = adding new)
  const [editingId, setEditingId] = useState(null);

  useEffect(() => {
    fetchRecords();
  }, []);

  const fetchRecords = async () => {
    try {
      const response = await axios.get('http://localhost:5000/api/records');
      setRecords(response.data);
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  // --- NEW: Handle Edit Click ---
  const handleEdit = (record) => {
    setEditingId(record.id); // Set mode to Edit
    setFormData({ name: record.name, email: record.email, role: record.role }); // Fill form
  };

  // --- NEW: Handle Delete Click ---
  const handleDelete = async (id) => {
    if (window.confirm('Are you sure you want to delete this record?')) {
      try {
        await axios.delete(`http://localhost:5000/api/records/${id}`);
        fetchRecords(); // Refresh list
        
        // If we deleted the item being edited, clear the form
        if (editingId === id) {
          setEditingId(null);
          setFormData({ name: '', email: '', role: '' });
        }
      } catch (error) {
        console.error('Error deleting record:', error);
      }
    }
  };

  // --- NEW: Cancel Edit ---
  const handleCancel = () => {
    setEditingId(null);
    setFormData({ name: '', email: '', role: 'User' });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsLoading(true);
    try {
      if (editingId) {
        // UPDATE Existing Record (PUT)
        await axios.put(`http://localhost:5000/api/records/${editingId}`, formData);
        setEditingId(null); // Reset mode to "Add New"
      } else {
        // CREATE New Record (POST)
        await axios.post('http://localhost:5000/api/records', formData);
      }
      
      fetchRecords(); // Refresh list
      setFormData({ name: '', email: '', role: 'User' }); // Clear form
    } catch (error) {
      console.error('Error saving record:', error);
    }
    setIsLoading(false);
  };

  return (
    <div className="container">
      <header>
        <h1>Unified Data Dashboard</h1>
      </header>

      <div className="main-interface">
        {/* LEFT PANEL: Dynamic Input Interface */}
        <div className="input-panel">
          <div className="panel-header">
            {/* Change Title based on mode */}
            <h2>{editingId ? 'Edit Record' : 'Add New Entry'}</h2>
            {editingId && <button onClick={handleCancel} className="cancel-btn">Cancel</button>}
          </div>
          
          <form onSubmit={handleSubmit}>
            <div className="form-group">
              <label>Name</label>
              <input type="text" name="name" value={formData.name} onChange={handleChange} required />
            </div>
            <div className="form-group">
              <label>Email</label>
              <input type="email" name="email" value={formData.email} onChange={handleChange} required />
            </div>
            <div className="form-group">
              <label>Role</label>
              <select name="role" value={formData.role} onChange={handleChange}>
                <option value="Admin">Admin</option>
                <option value="User">User</option>
                <option value="Guest">Guest</option>
              </select>
            </div>
            
            {/* Button changes text based on mode */}
            <button type="submit" disabled={isLoading} className={editingId ? 'update-btn' : 'save-btn'}>
              {isLoading ? 'Processing...' : (editingId ? 'Update Record' : 'Save to Database')}
            </button>
          </form>
        </div>

        {/* RIGHT PANEL: Database View with Actions */}
        <div className="view-panel">
          <div className="panel-header">
            <h2>Database Content</h2>
            <span className="badge">{records.length} Records</span>
          </div>
          <div className="table-wrapper">
            <table>
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Role</th>
                  <th>Actions</th> {/* New Column */}
                </tr>
              </thead>
              <tbody>
                {records.map((rec) => (
                  <tr key={rec.id} className={editingId === rec.id ? 'active-row' : ''}>
                    <td>#{rec.id}</td>
                    <td>{rec.name}</td>
                    <td>{rec.email}</td>
                    <td>
                      <span className={`status-pill ${rec.role ? rec.role.toLowerCase() : ''}`}>
                        {rec.role}
                      </span>
                    </td>
                    <td className="actions-cell">
                      <button className="icon-btn edit" onClick={() => handleEdit(rec)}>
                        ✎
                      </button>
                      <button className="icon-btn delete" onClick={() => handleDelete(rec.id)}>
                        ✕
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
}

export default App;