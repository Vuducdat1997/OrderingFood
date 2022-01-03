const express = require('express')
const router = express.Router()
const verifyToken = require('../middleware/auth')
const ProductCategory = require('../models/ProductCategory')

//@route Get api/product
//@desc Get product
//@access public
router.get('/', async(req, res) => {
    try {
        const productCategory = await ProductCategory.find({})
        res.json({ success: true, productCategory: productCategory })
    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: "Interval server error" })
    }
})

//@route POST api/product
//@desc Create product
//@access Private

router.post('/', async(req, res) => {
    const { name, type, status, urlIcon } = req.body

    //simple validation
    if (!name || !type || !status || !urlIcon)
        return res.status(400).json({ success: false, message: 'Value is require' })

    try {
        const newCategory = new ProductCategory({
            name,
            type,
            status,
            urlIcon
        })

        await newCategory.save()

        res.json({ success: true, category: newCategory })

    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: 'Internal server error!' })
    }
})

module.exports = router