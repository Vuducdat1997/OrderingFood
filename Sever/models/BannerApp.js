const mongoose = require('mongoose');
const Schema = mongoose.Schema

const BannerAppSchema = new Schema({
    title: {
        type: String,
        required: true
    },
    imageUrl: {
        type: String,
        required: true
    },
    order: {
        type: String,
        required: true
    },
    description: {
        type: String
    },
    status: {
        type: String,
        required: true
    },
    supplierId: {
        type: Schema.Types.ObjectId,
        required: true,
        ref: 'suppliers'
    }
})


module.exports = mongoose.model('bannerapps', BannerAppSchema)