FROM node:16.14
WORKDIR /app
COPY package*.json ./
RUN npm install

RUN if [ ! -d "/.npm" ]; then mkdir /.npm; fi
RUN if [ ! -d "/app/.angular" ]; then mkdir /app/.angular; fi

RUN chown -R 1009800000:0 /.npm
RUN chown -R 1009800000:0 /app/.angular
ENV API_URL=https://phase-2-backend-git-youssuf-el-tahan-dev.apps.sandbox-m4.g2pi.p1.openshiftapps.com/
USER 1009800000
COPY . .
# RUN chown -R 1009800000:0 /app/src/environments/environments.ts
# RUN sed -i "s|DEFAULT_API_URL|$API_URL|g" /app/src/environments/environments.ts

CMD ["npm", "start"]
