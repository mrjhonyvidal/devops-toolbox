# Specify a base image
# image:alpine means that will get only the most basic settings
# In case we use node instead of node:alpine
# Them it will install also Git, npm (Package manager, etc)
FROM node:alpine

# Defining place where will be placed the application inside container
# if the folder does not exist it will be created
WORKDIR /usr/app
########################################################################
# Copy files from relative build context inside container
COPY ./package.json ./

# Install some dependencies
# It only be execute if we make any changes to the files in the steps before
RUN npm install

# Now make the copy of all files
# this was separate from the COPY ./package.json ./
COPY ./ ./
########################################################################

# Default command
CMD ["npm", "start"]