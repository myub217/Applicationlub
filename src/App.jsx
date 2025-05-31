import { useEffect, useState } from 'react';
import { motion } from 'framer-motion';

export default function App() {
  const [users, setUsers] = useState([]);
  const [secret, setSecret] = useState(null);

  useEffect(() => {
    fetch('/api/users')
      .then(res => res.json())
      .then(setUsers)
      .catch(console.error);

    fetch('/api/secret')
      .then(res => res.json())
      .then(data => setSecret(data[0]?.info))
      .catch(() => setSecret('ไม่พบข้อมูลลับ 🕵️‍♂️'));
  }, []);

  return (
    <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} className="p-6 font-mono bg-gray-900 text-white min-h-screen">
      <h1 className="text-4xl font-black mb-6">🐈‍⬛ GreyX Dark Terminal</h1>
      <ul className="list-disc list-inside">
        {users.map(u => (
          <li key={u.id}>{u.name} ({u.role})</li>
        ))}
      </ul>
      <p className="mt-4">{secret}</p>
    </motion.div>
  );
}
