const mongoose = require('mongoose');
const Schema = mongoose.Schema

const ProductSchema = new Schema({
    name: {
        type: String,
        required: true,
    },
    title: {
        type: String,
        required: true,
    },

    price: {
        type: String,
        required: true
    },
    url: {
        type: String,
        required: true,
    },
    type: {
        type: String,
        required: true,
    },
    order: {
        type: String,
        required: true,
    },
    supplierId: {
        type: Schema.Types.ObjectId,
        ref: 'suppliers'
    },
    categoryId: {
        type: Schema.Types.ObjectId,
        ref: 'productCategory'
    }
})

module.exports = mongoose.model('products', ProductSchema)