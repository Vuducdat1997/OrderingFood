const mongoose = require('mongoose');
const Schema = mongoose.Schema

const ProductCategorySchema = new Schema({
    name: {
        type: String,
        required: true
    },
    type: {
        type: String,
        required: true
    },
    status: {
        type: String,
        required: true
    },
    urlIcon: {
        type: String,
        required: true
    }
})

module.exports = mongoose.model('productCategory', ProductCategorySchema)