"use strict";

const axios = require("axios");

module.exports.handler = (event, context, callback) => {
    event.validateStatus = function(status) {
        return !!status;
    };
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
