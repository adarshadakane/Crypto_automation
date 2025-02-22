FROM node:16
# COPY api/ /usr/cryptowebsite/api/
# COPY web/ /usr/cryptowebsite/web/
WORKDIR /usr/cryptoshare/api/
RUN npm install
EXPOSE 3190
CMD ["npm", "start"]
