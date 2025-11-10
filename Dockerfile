# ==============================
# Etapa 1: Construcción de la app con Node
# ==============================
FROM node:20-alpine AS build

# Crear directorio de trabajo
WORKDIR /app

# Copiar package.json e instalar dependencias
COPY package*.json ./
RUN npm install

# Copiar el resto del código fuente
COPY . .

# Construir la app para producción
RUN npm run build

# ==============================
# Etapa 2: Servir con Nginx
# ==============================
FROM nginx:alpine

# Copiar los archivos de producción de Vite (dist) al servidor web
COPY --from=build /app/dist /usr/share/nginx/html

# Exponer el puerto 80 para servir la aplicación
EXPOSE 80

# Comando por defecto para ejecutar Nginx
CMD ["nginx", "-g", "daemon off;"]
