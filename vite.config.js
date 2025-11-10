import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    host: true, // permite que Docker exponga correctamente el servidor
    port: 5173  // puerto por defecto de Vite
  }
});
