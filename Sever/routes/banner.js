const express = require('express')
const BannerApp = require('../models/BannerApp')
const router = express.Router()
const Supplier = require('../models/BannerApp')

//@route Get api/banner
//@desc Get banner
//@access public
router.get('/', async(req, res) => {
    try {
        const banner = await BannerApp.find({})
        res.json({ success: true, banner: banner })
    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: "Interval server error" })
    }
})

//@route POST api/banner
//@desc Create banner
//@access Private

router.post('/', async(req, res) => {
    const { title, imageUrl, order, status, supplierId } = req.body
    try {
        const newBannerApp = new BannerApp({
            title,
            imageUrl,
            order,
            status,
            supplierId
        })

        await newBannerApp.save()

        res.json({ success: true, banner: newBannerApp })

    } catch (error) {
        console.log(error)
        res.status(500).json({ success: false, message: 'Internal server error!' })
    }
})

module.exports = router