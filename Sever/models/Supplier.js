const mongoose = require('mongoose');
const Schema = mongoose.Schema

const SupplierSchema = new Schema({
    name: {
        type: String,
        required: true,
    },
    title: {
        type: String,
        required: true,
    },
    address: {
        type: String,
        required: true
    },
    contact: {
        type: String,
        required: true
    },
    bannerUrl: {
        type: String,
        required: true,
    },
    iconUrl: {
        type: String,
        required: true,
    }
})

module.exports = mongoose.model('suppliers', SupplierSchema)