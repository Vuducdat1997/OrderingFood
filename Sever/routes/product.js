const express = require('express')
const router = express.Router()
const verifyToken = require('../middleware/auth')
const Product = require('../models/Product')

//@route Get api/product
//@desc Get product
//@access public
router.get('/', async(req, res) => {
    try {
        const product = await Product.find({})
        res.json({ success: true, product: product })
    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: "Interval server error" })
    }
})

//@route Get api/product/popular
//@desc Get popular
//@access public
router.get('/popular', async(req, res) => {
    try {
        const product = await Product.find({ type: "2" })
        res.json({ success: true, product: product })
    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: "Interval server error" })
    }
})

// //@route Get api/supplier
// //@desc Get supplier By id
// //@access Private
router.post('/getProduct', async(req, res) => {
    try {
        const { id } = req.body
        const product = await Product.findById(id)
        res.json({ success: true, product: product })
    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: "Interval server error" })
    }
})



//@route POST api/product
//@desc Create product
//@access Private

router.post('/', async(req, res) => {
    const { name, title, price, url, type, order, supplierId, categoryId } = req.body

    //simple validation
    if (!title || !name || !price || !url || !type || !order || !supplierId)
        return res.status(400).json({ success: false, message: 'Value is require' })

    try {
        const newProduct = new Product({
            name,
            title,
            price,
            url,
            type,
            order,
            supplierId,
            categoryId
        })

        await newProduct.save()

        res.json({ success: true, message: 'Save Success!', product: newProduct })

    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: 'Internal server error!' })
    }
})





module.exports = router