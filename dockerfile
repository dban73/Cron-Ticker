# /app
#FROM --platform=linux/amd64 node:19.2-alpine3.16
FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16
# cd app
WORKDIR /app

#Dest ./app
COPY package.json ./

#Instalar las dependencias
RUN npm install 

#Dest ./app
COPY . .

#Raalizar testing
RUN npm run test

#Eliminar archivos y directorios no necesarios en PROD
RUN rm -rf tests && rm -rf node_modules

#Instalar las dependencias de pord
RUN npm install --prod

#Comando run de la aplicacion
CMD [ "node","app.js" ]