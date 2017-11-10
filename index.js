"use strict";

const axios = require("axios");

module.exports.handler = (event, context, callback) => {
    axios(event)
        .then(function(response) {
            delete response.request;
            callback(null, response);
        })
        .catch(function(err) {
            console.error("Error: " + err);
            callback(err);
        });
};
