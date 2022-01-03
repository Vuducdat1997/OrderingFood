const express = require('express')
const router = express.Router()
const verifyToken = require('../middleware/auth')
const Supplier = require('../models/Supplier')
const Product = require('../models/Product')
    //@route Get api/supplier
    //@desc Get supplier
    //@access Private
router.get('/', async(req, res) => {
    try {
        const supplier = await Supplier.find({})
        res.json({ success: true, suppliers: supplier })
    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: "Interval server error" })
    }
})

//@route Get api/supplier
//@desc Get supplier By id
//@access Private
router.post('/getSupplier', async(req, res) => {
    try {
        const { id } = req.body
        const supplier = await Supplier.findById(id)
        const product = await Product.find({ supplierId: id })
        res.json({ success: true, supplier: supplier, product: product })
    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: "Interval server error" })
    }
})

//@route POST api/supplier
//@desc Create supplier
//@access Private

router.post('/', async(req, res) => {
    const { name, title, address, contact, bannerUrl, iconUrl } = req.body

    //simple validation
    if (!title || !name || !address || !contact || !bannerUrl || !iconUrl)
        return res.status(400).json({ success: false, message: 'Value is require' })

    try {
        const newSupplier = new Supplier({
            name,
            title,
            address,
            address,
            contact,
            bannerUrl,
            iconUrl
        })

        await newSupplier.save()

        res.json({ success: true, message: 'Save Success!', supplier: newSupplier })

    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: 'Internal server error!' })
    }
})

module.exports = router