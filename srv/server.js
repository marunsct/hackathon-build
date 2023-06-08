"use strict";

const cds = require("@sap/cds");
const cors = require("cors");
cds.on("bootstrap", app => app.use(cors()));
console.log("HI");
module.exports = cds.server;