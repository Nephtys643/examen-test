FROM node:18-alpine

WORKDIR /app

# Copier uniquement les fichiers nécessaires à l'installation
COPY package.json package-lock.json ./

# Installation propre et déterministe (prod uniquement)
RUN npm ci --omit=dev

# Copier le reste du code
COPY . .

# Exposition du port si nécessaire (ex: 3000)
EXPOSE 3000

# Lancement de l'application
CMD ["node", "index.js"]
