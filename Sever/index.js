require('dotenv').config()
const express = require('express')
const mongoose = require('mongoose')
    // const auth = require('registry-auth-token')

const authRouter = require('./routes/auth')
const postRouter = require('./routes/post')
const supplierRouter = require('./routes/supplier')
const productRouter = require('./routes/product')
const categoryRouter = require('./routes/productCategory')
const bannerRouter = require('./routes/banner')
const connectDB = async() => {
    try {
        await mongoose.connect(`mongodb+srv://${process.env.DB_USERNAME}:${process.env.DB_PASSWORD}@cluster0.sqvpj.mongodb.net/Food-ordering-app?retryWrites=true&w=majority`, {
            useNewUrlParser: true,
            useUnifiedTopology: true
        })

        console.log('MongoDB connected')
    } catch (error) {
        console.log(error)
        process.exit(1)
    }
}

connectDB()

const app = express()
app.use(express.json())
app.use('/api/auth', authRouter)
app.use('/api/posts', postRouter)
app.use('/api/supplier', supplierRouter)
app.use('/api/product', productRouter)
app.use('/api/category', categoryRouter)
app.use('/api/banner', bannerRouter)
const PORT = 5000

app.listen(PORT, () => console.log(`Server started on port ${PORT}`))